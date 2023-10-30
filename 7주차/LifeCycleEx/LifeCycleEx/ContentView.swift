//
//  ContentView.swift
//  LifeCycleEx
//
//  Created by kwon ji won on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var selectedColor: Color

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ColorPickerView(selectedColor: $selectedColor)) {
                    Text("Select Color")
                }
                Rectangle()
                    .fill(selectedColor)
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .padding()
            }
            .navigationTitle("Theme Color App")
        }
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(selectedColor: Binding<Color>)
//    }
//}
