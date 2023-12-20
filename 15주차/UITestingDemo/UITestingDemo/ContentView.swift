//
//  ContentView.swift
//  UITestingDemo
//
//  Created by kwon ji won on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showLogin = false
    
    var body: some View {
        VStack {
            Text("Welcom!")
                .font(.title)
            
            Button {
                showLogin = true
            } label: {
                Text("Login")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
