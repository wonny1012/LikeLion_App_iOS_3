//
//  TapView.swift
//  GridRow
//
//  Created by kwon ji won on 11/9/23.
//

import SwiftUI

struct TapView: View {
    
    @State private var selection = 1
    
    var body: some View {
        
        Text("\(selection)")
        
        TabView(selection: $selection) {
            Text("First")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }.tag(1)
            Text("Second")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }.tag(2)
            Text("Third")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }.tag(3)
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .tabViewStyle(PageTabViewStyle())
        //naver로 하면 배경이 안보임, .always를 하면 배경 (인디케이터)로 보임
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }

}

#Preview {
    TapView()
}
