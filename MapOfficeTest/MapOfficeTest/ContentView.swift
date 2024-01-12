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
    @State var selectedOffice: OfficeInfo?
    @State var coord: (Double, Double) = (126.9784147, 37.5666805)
    @State var markers: [NMFMarker] = []
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    Button("주소")
                    {
                        naverGeocodeAPI.fetchLocationForPostalCode("서울특별시 중구 충무로1가 21-1")
                    }
                    List {
                        Text(network.resultMessage ?? "")
                        ForEach(network.posts, id: \.self) { result in
                            HStack {
                                Button(action: {
                                    selectedOffice = result
                                    updateMarkers() // 선택된 우체국이 변경될 때마다 마커 업데이트
                                }) {
                                    VStack {
                                        HStack {
                                            Text(result.name)
                                        }
                                        
                                    }
                                }
                                
                            }
                        }
                    }
                }
                .onAppear() {
                    network.fetchData()
                    
                }
                .zIndex(1)
                UIMapView(coord: (selectedOffice?.latitude ?? 126.9784147, selectedOffice?.longitude ?? 37.5666805), markers: markers)
            }
        }
    }
    
    private func updateMarkers() {
        guard let selectedOffice = selectedOffice else {
            return
        }
        
        // 기존 마커 제거
        markers.forEach { marker in
            marker.mapView = nil
        }
        markers.removeAll()
        
        // 새로운 마커 추가
        let marker = NMFMarker(position: NMGLatLng(lat: selectedOffice.latitude ?? 126.9784147, lng: selectedOffice.longitude ?? 37.5666805))
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
            //                    uiView.mapView.clear
            
            // 선택된 우체국의 좌표로 지도 중심 이동
            let updatedCoord = NMGLatLng(lat: coord.1, lng: coord.0)
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
