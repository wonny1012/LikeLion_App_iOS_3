//
//  ContentView.swift
//  MidFcstInfoServiceAPI
//
//  Created by kwon ji won on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = MidFcstInfoServiceAPI.shared

      var body: some View {
          NavigationStack {
              List {
                  Text(network.resultMessage ?? "")
                  ForEach(network.posts, id: \.self) { result in
                      HStack {
                          Text(result.wfSv)
                              .bold()
                      }
                      .padding(5)
                  }
              }.navigationTitle("Weather")
          }
          .onAppear() {
              network.feachData()
          }
      }
  }
