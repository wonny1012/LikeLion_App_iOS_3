//
//  ContentView.swift
//  musicAPI_Practice
//
//  Created by kwon ji won on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = MusicAPI.shared
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(network.posts, id: \.self) { result in
                    HStack() {
                        //                        artworkUrl60
                        AsyncImage(url: URL(string:result.artworkUrl60))
                            .frame(width: 120, height: 80)
                        VStack(alignment: .leading) {
                            Text(result.artistName)
                            Text(result.trackName)
                        }
                    }
                    .padding(5)
                }
            }
            .navigationTitle("Music List")
        }
        .onAppear() {
            network.feachData()
        }
    }
}


