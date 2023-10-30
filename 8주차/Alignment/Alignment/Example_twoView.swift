//
//  Example_twoView.swift
//  Alignment
//
//  Created by kwon ji won on 10/30/23.
//

import SwiftUI

struct Example_twoView: View {
    
    @State private var icup = "square.and.arrow.up"
    @State private var icdown = "square.and.arrow.down"
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: icup)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Spacer()
            
            HStack() {
                Spacer()
                Button("UP") {
                    if icup.hasSuffix("down") {
                        (icup, icdown) = (icdown, icup)
                    }
                }
                .mickeyButtonModifier()
                
                Spacer()
                Button("DOWN") {
                    if icdown.hasSuffix("up") {
                        (icup, icdown) = (icdown, icup)
                    }
                }
                .mickeyButtonModifier()
                
                Spacer()
            }
            
            Spacer()
            Image(systemName: icdown)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)

        }
    }
}

#Preview {
    Example_twoView()
}
