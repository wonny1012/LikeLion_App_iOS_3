//
//  Example_1.swift
//  List
//
//  Created by kwon ji won on 11/1/23.
//

import SwiftUI

struct Example_1: View {
    var body: some View {
        VStack {
            Text("SwiftUI List Quiz")
                        .font(.largeTitle)
                        .padding()
            List(1...10, id: \.self) { index  in
                Text("Item \(index)")
                    .foregroundColor(.blue)
            }
            .listRowBackground(Color.white)
        }
    }
}

#Preview {
    Example_1()
}
