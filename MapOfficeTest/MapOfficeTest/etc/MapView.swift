//
//  MapView.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/10/24.
//

import SwiftUI
import NMapsMap

struct NaverMap: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator.shared
    }
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        context.coordinator.getNaverMapView()
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}

}
