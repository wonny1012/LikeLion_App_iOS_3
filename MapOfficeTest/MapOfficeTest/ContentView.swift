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
    
    //좌표를 찍기 위해 필요한값
    @State private var selectedLocation: NMGLatLng?
    @State var markers: [NMFMarker] = []
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        ForEach(network.posts, id: \.self) { result in
                            VStack {
                                HStack {
                                    Button(result.address)
                                    {
                                        naverGeocodeAPI.fetchLocationForPostalCode(result.address) { latitude, longitude in
                                            if let latitude = latitude, let longitude = longitude {
                                                selectedLocation = NMGLatLng(lat: latitude, lng: longitude)
                                            
                                                //클릭이 된다면 위,경도를 이용해서 위치를 보여준다.
                                                //클릭할때마다 뷰를 바꿔줘야한다.
                                                coordinator.fetchLocation(latitude: latitude, longitude: longitude, name: result.name)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
       
                    NaverMap()
                    
                        .ignoresSafeArea(.all, edges: .top)
                        .onAppear() {
                            
                            for result in network.posts {
                                naverGeocodeAPI.fetchLocationForPostalCode(result.address) { 
                                    latitude, longitude in
                                    if let latitude = latitude, let longitude = longitude {
                                        selectedLocation = NMGLatLng(lat: latitude, lng: longitude)
                                        
                                        let marker = NMFMarker()
                                        let view = NMFNaverMapView(frame: .zero)
                                        
                                        let locationOverlay = view.mapView.locationOverlay
                                        locationOverlay.hidden = true
                                        marker.position = NMGLatLng(lat: latitude, lng: longitude)
                                        marker.captionText = result.name
                                        marker.mapView = view.mapView
                                        print("Sucess")
                                    }
                                    
                                }
                            }
                            
                        }
                    
                }
                .onAppear() {
                    CLLocationManager().requestWhenInUseAuthorization()
                    network.fetchData()
                    
                }
                .zIndex(1)
           }
        }
    }
}
