//
//  ContentView.swift
//  Observable_State_Environment
//
//  Created by kwon ji won on 2023/10/13.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @ObservedObject var demoData: DemoData1 = DemoData1()
    
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    let speedsetting = SpeedSetting()
    
    var body: some View {
        VStack {
            
            Text("Hello, World!")
            Text("\(demoData.currentUser), you \(demoData.userCount)")
            
            //프로퍼티 이름 앞 "$" : 상태 프로퍼티와 바인딩(연결)하는 역할
            Toggle(isOn: $wifiEnabled, label: {
                Text("Enable Wi-Fi")
            } )
            TextField("Enter user name", text: $userName)
            
            Text( userName )
            WifiImageView(wifiEnabled: $wifiEnabled)
            VStack {
                speedControlView()
                speedDisplayView()
            }
            .environmentObject(speedsetting)
        }
        .padding()
    }
}

class DemoData1: ObservableObject {
    // @Published 프로퍼티 레퍼를 이용하여 프로퍼티를 게시
    @Published var userCount = 0
    @Published var currentUser = ""
    
    init() {
        updateData()
    }
    
    func updateData() {
        
    }
}

class SpeedSetting: ObservableObject {
    @Published var speed = 0.0
}

struct speedControlView: View {
    @EnvironmentObject var speedsetting: SpeedSetting
    var body: some View {
        Slider(value: $speedsetting.speed, in: 0...100)
    }
}


struct speedDisplayView: View {
    @EnvironmentObject var speedsetting: SpeedSetting
    var body: some View {
        Text("Speed = \(speedsetting.speed)")
    }
    
}
