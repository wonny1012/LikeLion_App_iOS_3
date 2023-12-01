//
//  ContentView.swift
//  SwiftAPI_Example2
//
//  Created by kwon ji won on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = PapagoAPI.shared
    @State var sourceString = "난 이 점수 만족 아닐세 "

       var body: some View {
           VStack {
               Text(network.targetString ?? "")
               TextField("안녕", text: $sourceString)
                   .multilineTextAlignment(.center)
                   .textFieldStyle(.roundedBorder)
               Button("번역") {
                   network.feachData( sourceString )
               }
           }
           .padding()
       }
   }
