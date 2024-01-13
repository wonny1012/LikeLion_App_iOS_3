//
//  ContentView.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/9/24.
//
// 코코아팟 설치하기 https://seons-dev.tistory.com/entry/%EC%99%95-%EC%B4%88%EB%B3%B4%EB%A5%BC-%EC%9C%84%ED%95%9C-CocoaPods%EC%BD%94%EC%BD%94%EC%95%84%ED%8C%9F-%ED%8A%9C%ED%86%A0%EB%A6%AC%EC%96%BC
//https://jeong9216.tistory.com/1981

import SwiftUI
import MapKit
import CoreLocation
import NMapsMap

struct ContentView: View {
    //StateObject : UI와 ObserveavbleObject를 연결해주는 역할
    @StateObject var network = OfficeInfoServiceAPI.shared
    @StateObject var coordinator: Coordinator = Coordinator.shared
    @StateObject var naverGeocodeAPI = NaverGeocodeAPI.shared
    @StateObject var combinedAPI = CombinedAPIService.shared
    @State var markers: [NMFMarker] = []
    @State var coord: (Double, Double) = (126.9784147, 37.5666805)
    
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        ForEach(network.posts, id: \.self) { result in
                                    VStack {
                                        HStack {
                                            Button(result.name)
                                            {
                                                naverGeocodeAPI.fetchLocationForPostalCode(result.address) { latitude, longitude in
                                                    if let latitude = latitude, let longitude = longitude {
                                                        // 업데이트 로직을 여기에 추가하십시오.
                                                        // 예를 들어, 선택된 위치를 업데이트하고 지도에 마커를 표시할 수 있습니다.
//                                                        selectedOffice = result
                                                        coord = (longitude, latitude)
                                                        updateMarkers(latigude: coord.0, longtitude: coord.1)
                                                        UIMapView(coord: coord, markers: markers)
                                                    }
                                                }
                                            }
                                        }
                                        
                                    }
                        }
                    }
                }
                .onAppear() {
                    network.fetchData()
//                    address.fetchData()
                    
                }
                .zIndex(1)
                UIMapView(coord: (Double(naverGeocodeAPI.targetLocation?.latitude ?? "126.9784147") ?? 126.9784147, Double(naverGeocodeAPI.targetLocation?.longitude ?? "37.5666805") ?? 37.5666805), markers: markers)

            }
        }
    }
    
    private func updateMarkers(latigude: Double, longtitude: Double) {

        // 기존 마커 제거
        markers.forEach { marker in
            marker.mapView = nil
        }
        markers.removeAll()
        
//         새로운 마커 추가
        let marker = NMFMarker(position: NMGLatLng(lat: coord.0, lng: coord.1))
            marker.mapView = NMFNaverMapView().mapView
                markers.append(marker)
    }
    
    
    struct UIMapView: UIViewRepresentable {
        var coord: (Double, Double)
        var markers: [NMFMarker]
        
        func makeUIView(context: Context) -> NMFNaverMapView {
            let view = NMFNaverMapView()
            view.showZoomControls = false
            view.mapView.positionMode = .direction
            view.mapView.zoomLevel = 17
            
            // 기존 마커 추가
            markers.forEach { marker in
                marker.mapView = view.mapView
            }
            
            return view
        }
        
        func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
            // 기존 마커 제거
//                                uiView.mapView.clear()
            
            // 선택된 우체국의 좌표로 지도 중심 이동
            let updatedCoord = NMGLatLng(lat: coord.0, lng: coord.1)
            let cameraUpdate = NMFCameraUpdate(scrollTo: updatedCoord)
            cameraUpdate.animation = .fly
            cameraUpdate.animationDuration = 1
            uiView.mapView.moveCamera(cameraUpdate)
            
            // 선택된 우체국에 대한 마커 추가
            markers.forEach { marker in
                marker.mapView = uiView.mapView
            }
        }
    }
}
