//
//  Example_4.swift
//  List
//
//  Created by kwon ji won on 11/1/23.
//

import SwiftUI

struct Example_4: View {
    
    @State private var switchsArray: [Bool] = Array(repeating: false, count: 10)
    
    var body: some View {
        Text("SwiftUI List Quiz")
                    .font(.largeTitle)
                    .padding()
                List(0...9, id: \.self) { item in
                    HStack {
                        Text("Item \(item + 1)")
                            .fontWeight(switchsArray[item] ? .bold : .regular)
                        Spacer()
                        Toggle("", isOn: $switchsArray[item])
                    }
                }
    }
}

#Preview {
    Example_4()
}
