//
//  Example_oneView.swift
//  Alignment
//
//  Created by kwon ji won on 10/30/23.
//

import SwiftUI

struct CircleIamgeView: View {
    
    var body: some View {
        Image("mickey")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .frame(width: 100, height: 100)
    }
}

extension Button {
    func mickeyButtonModifier() -> some View {
        self
            .frame(width: 80)
            .padding(5)
            .foregroundColor(Color.white)
            .background(Color.indigo)
            .cornerRadius(5)
    }
}


struct Example_oneView: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                CircleIamgeView()
                Spacer()
            }
        }
        
        HStack() {
            CircleIamgeView()
            CircleIamgeView()
            CircleIamgeView()
        }
        .padding()
        
        HStack() {
            CircleIamgeView()
            CircleIamgeView()
            CircleIamgeView()
        }
        .padding()
        
        Spacer()
        
        HStack(alignment: .center) {
            Button("BUTTON") {}
                .mickeyButtonModifier()
            Spacer()
            Button("BUTTON") {}
                .mickeyButtonModifier()
            Spacer()
            Button("BUTTON") {}
                .mickeyButtonModifier()
        }
        .padding()
    }
}

#Preview {
    Example_oneView()
}
