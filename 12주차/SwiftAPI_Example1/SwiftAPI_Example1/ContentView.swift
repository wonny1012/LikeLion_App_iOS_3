//
//  ContentView.swift
//  SwiftAPI_Example1
//
//  Created by kwon ji won on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = WeatherAPI.shared
    
    var body: some View {
        NavigationStack {
            List {
                //result는 weather이다.
                ForEach(network.posts, id: \.self) { result in
                    HStack {
                        let iconUrlString = "https://openweathermap.org/img/wn/\(result.icon)@2x.png"
                        AsyncImage(url: URL(string: iconUrlString))
                            .frame(width: 120, height: 80)
                        
                        Text(result.main)
                            .bold()
                        
                        Text(result.description)
                            .bold()
//                        Text("asd")
                    }
                    .padding(5)
                }
            }.navigationTitle("\(network.weatherResults?.name ?? "" ) Weather")
        }
        .onAppear() {
            network.feachData()
        }
    }
}

#Preview {
    ContentView()
}
