//
//  LifeCycleExApp.swift
//  LifeCycleEx
//
//  Created by kwon ji won on 2023/10/26.
//

import SwiftUI

@main
struct LifeCycleExApp: App {
    @AppStorage("selectedColor") var selectedColor: Color = Color.white
    
//    @AppStorage("KEY") var Name: Type = Value
    var body: some Scene {
        WindowGroup {
            ContentView(selectedColor: $selectedColor)
        }
    }
}
