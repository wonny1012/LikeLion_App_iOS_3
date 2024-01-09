//
//  ContentView.swift
//  MapOfficeTest
//
//  Created by kwon ji won on 1/9/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @StateObject var network = OfficeInfoServiceAPI.shared
    
    var body: some View {
        NavigationStack {
            List {
                Text(network.resultMessage ?? "")
                ForEach(network.posts, id: \.self) { result in
                    HStack {
                        Text(result.name)
                            .bold()
                    }
                    .padding(5)
                }
            }.navigationTitle("Offices")
        }
        .onAppear() {
            network.fetchData()
        }
    }
}

//#Preview {
//    ContentView()
//}
