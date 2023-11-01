//
//  Example_2.swift
//  Navigation
//
//  Created by kwon ji won on 11/1/23.
//

import SwiftUI

struct Example_2: View {
    
    @State var number = 0
    
    var body: some View {
        NavigationStack {
              Text("Go to Second View")
            NavigationLink(<#LocalizedStringKey#>, value: number)
        }
        .navigationTitle("FirstView")
        .navigationDestination(isPresented:, destination: SecondView2)
        
    }
}

struct SecondView2: View {
    @Binding var number: String
    var body: some View {
        VStack {
            Text("Second View Contenct")
            Text(number)
        }
    }
}

#Preview {
    Example_2()
}
