//
//  Example_1.swift
//  Navigation
//
//  Created by kwon ji won on 11/1/23.
//

import SwiftUI

struct Example_1: View {
    
    @State private var firstViewTitle = "First View"
    @State private var secondViewTitle = "Second View"
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: SecondView1(title: $secondViewTitle)) {
                Text("Go to Second View")
            }
            .navigationTitle(firstViewTitle)
        }
    }
}

struct SecondView1: View {
    @Binding var title: String
    var body: some View {
        VStack {
            Text("Second View Content")
        }
        .navigationTitle(title)
        .onDisappear() {
            title = "Second View"
        }
    }
}



#Preview {
    Example_1()
}
