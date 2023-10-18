//
//  Example3.swift
//  6weeks_UIExample
//
//  Created by kwon ji won on 2023/10/16.
//

import SwiftUI

struct Example3: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
                
                Spacer()
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 4 * 3)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
                
                Spacer()
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
            }
        }
    }
}

struct Example3_Previews: PreviewProvider {
    static var previews: some View {
        Example3()
    }
}
