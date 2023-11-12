//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by kwon ji won on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    //목록의 배열을 만들어준다.
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor: String?
    
    var body: some View {
        NavigationSplitView {
            List(colors, id: \.self, selection: $selectedColor) { color in
                Text(color)
            }
            .navigationSplitViewColumnWidth(100)
        } detail: {
            Text("Hello \(selectedColor ?? "No color selected")")
        }
        .navigationSplitViewStyle(.balanced)
    }
}
#Preview {
    ContentView()
}
