//
//  Example2.swift
//  6weeks_UIExample
//
//  Created by kwon ji won on 2023/10/16.
//

import SwiftUI

struct Example2: View {
    @State private var count:Int = 0
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("\(count)")
                Spacer()
                Button("Click!") {
                    count += 1
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .background(Color.indigo)
                .cornerRadius(5)
                .foregroundColor(.white)
            }
            .background(.teal)
        }
        
    }
}

struct Example2_Previews: PreviewProvider {
    static var previews: some View {
        Example2()
    }
}
