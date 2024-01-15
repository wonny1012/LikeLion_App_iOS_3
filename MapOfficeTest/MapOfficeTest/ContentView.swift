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
                                                selectedLocation = NMGLatLng(lat: latitude, lng: longitude)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                    NaverMap()
                        .ignoresSafeArea(.all, edges: .top)
                    
                }
                .onAppear() {
                    network.fetchData()
                    
                }
                .zIndex(1)
           }
        }
    }
}
