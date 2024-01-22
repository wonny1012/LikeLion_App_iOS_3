//
//  MyCoord.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/22/24.
//

import Foundation

/**
 사용자 정의 지도 위치
 */
struct MyCoord {
    var name: String
    var lat: Double
    var lng: Double
    
    init(_ lat: Double, _ lng: Double, _ name: String = "") {
        self.name = name
        self.lat = lat
        self.lng = lng
    }
}
