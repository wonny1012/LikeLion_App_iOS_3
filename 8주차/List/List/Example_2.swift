//
//  Example_2.swift
//  List
//
//  Created by kwon ji won on 11/1/23.
//

import SwiftUI

struct Example_2: View {
    var body: some View {
        Text("Swift List Quiz")
            .font(.largeTitle)
            .padding()
        List(1...5, id: \.self) { index in
            Section(header: Text("Section\(index)").foregroundColor(.black)) {
                
                ForEach(1...3, id: \.self) { rowIndex in
                    Text("Row\(rowIndex)")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            .listRowBackground(Color.gray)
        }
    }
}

#Preview {
    Example_2()
}
