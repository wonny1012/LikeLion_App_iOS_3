//
//  Coordinator.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/10/24.
//

import UIKit
import NMapsMap

// - NMFMapViewCameraDelegate 카메라 이동에 필요한 델리게이트,
// - NMFMapViewTouchDelegate 맵 터치할 때 필요한 델리게이트,
// - CLLocationManagerDelegate 위치 관련해서 필요한 델리게이트

class Coordinator: NSObject, ObservableObject,
                         NMFMapViewCameraDelegate,
                         NMFMapViewTouchDelegate,
                         CLLocationManagerDelegate {
    
    
    //shared는 싱글톤
    static let shared = Coordinator()
    
    // 클래스 상단에 변수 설정을 해서 위치 정보 제공 동의함수를 사용
    @Published var coord: (Double, Double) = (37.5626106, 126.9775524)
    //지금 위치에 좌표 설정
    @Published var userLocation: (Double, Double) = (37.5626106, 126.9775524)
    
    //위치 정보를 관리하고, 사용자의 위치에 관련된 작업을 수행하는데 사용
    var locationManager: CLLocationManager?
    //지도 위에 정보 창을 표시하는데 사용될 정보 창 객체
    let startInfoWindow = NMFInfoWindow()
    
    //네이버 지도를 표시하는 역할을 하는 뷰
    let view = NMFNaverMapView(frame: .zero)
    
    //coordinator 클래스 안의 코드
    override init() {
        super.init()
        
        view.mapView.positionMode = .direction
        view.mapView.isNightModeEnabled = true
        
        view.mapView.zoomLevel = 15 // 기본 맵이 표시될때 줌 레벨
        view.mapView.minZoomLevel = 10 // 최소 줌 레벨
        view.mapView.maxZoomLevel = 17 // 최대 줌 레벨
        
        view.showLocationButton = true // 현위치 버튼: 위치 추적 모드를 표현합니다. 탭하면 모드가 변경됩니다.
        view.showZoomControls = true // 줌 버튼: 탭하면 지도의 줌 레벨을 1씩 증가 또는 감소합니다.
        view.showCompass = true //  나침반 : 카메라의 회전 및 틸트 상태를 표현합니다. 탭하면 카메라의 헤딩과 틸트가 0으로 초기화됩니다. 헤딩과 틸트가 0이 되면 자동으로 사라집니다
        view.showScaleBar = true // 스케일 바 : 지도의 축척을 표현합니다. 지도를 조작하는 기능은 없습니다.
        
        view.mapView.addCameraDelegate(delegate: self)
        view.mapView.touchDelegate = self
        
    }

    
    func mapView(_ mapView: NMFMapView, cameraWillChangeByReason reason: Int, animated: Bool) {
        // 카메라 이동이 시작되기 전 호출되는 함수
    }
    
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        // 카메라의 위치가 변경되면 호출되는 함수
    }
    
    // MARK: - 위치 정보 동의 확인
    
    /*
     ContetView 에서 .onAppear 에서 위치 정보 제공을 동의 했는지 확인하는 함수를 호출한다.
     위치 정보 제공 동의 순서
     1. MapView에서 .onAppear에서 checkIfLocationServiceIsEnabled() 호출
     2. checkIfLocationServiceIsEnabled() 함수 안에서 locationServicesEnabled() 값이 true인지 체크
     3. true일 경우(동의한 경우), checkLocationAuthorization() 호출
     4. case .authorizedAlways(항상 허용), .authorizedWhenInUse(앱 사용중에만 허용) 일 경우에만 fetchUserLocation() 호출
     */

    //인스턴스 메서드
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("위치 정보 접근이 제한되었습니다.")
        case .denied:
            print("위치 정보 접근을 거절했습니다. 설정에 가서 변경하세요.")
        case .authorizedAlways, .authorizedAlways:
            print("Success")
            
            coord = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
            
//            userLocation = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
            //임의값을 넣음
            if let latitude = locationManager.location?.coordinate.latitude,
                           let longitude = locationManager.location?.coordinate.longitude {
                            fetchUserLocation(latitude: latitude, longitude: longitude)
                        }
            
        @unknown default:
            break
        }
    }
    
    func checkIfLocationServiceIsEnabled() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                DispatchQueue.main.async {
                    self.locationManager = CLLocationManager()
                    self.locationManager!.delegate = self
                    self.locationManager!.requestWhenInUseAuthorization()
                    self.checkLocationAuthorization()
                }
            } else {
                print("Show an alert letting them know this is off and to go turn i on")
            }
        }
    }
    //센터를 이동한 뒤 마커를 찍는다. 
    
    // MARK: - NMFMapView에서 제공하는 locationOverlay를 현재 위치로 설정
    func fetchUserLocation(latitude: Double, longitude: Double) {
        //위치 정보를 관리하는 CLLocationManagerzm 클래스의 인스턴스
        if let locationManager = locationManager {
            //현재 위치의 위, 경도를 나타낸다.
//            let lat = locationManager.location?.coordinate.latitude
//            let lng = locationManager.location?.coordinate.longitude
            
//            print(lat,lng)
            coord = (latitude,longitude)
            
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude, lng: longitude), zoomTo: 15)
            cameraUpdate.animation = .easeIn
            cameraUpdate.animationDuration = 1
            
            let locationOverlay = view.mapView.locationOverlay
            locationOverlay.location = NMGLatLng(lat: latitude, lng: longitude)
            locationOverlay.hidden = false
            
            locationOverlay.icon = NMFOverlayImage(name: "location_overlay_icon")
            locationOverlay.iconWidth = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
            locationOverlay.iconHeight = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
            locationOverlay.anchor = CGPoint(x: 0.5, y: 1)
            
            view.mapView.moveCamera(cameraUpdate)
        }
    }
    
    func getNaverMapView() -> NMFNaverMapView {
        view
    }
    

}
