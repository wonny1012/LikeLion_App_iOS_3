//
//  ContentView.swift
//  Animation
//
//  Created by kwon ji won on 12/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x:187, y:187))
                path.addArc(center: CGPoint(x:187, y:187), radius: 150, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
            }
            .fill(.purple)
            Path { path in
                path.move(to: CGPoint(x:187, y:187))
                path.addArc(center: CGPoint(x:187, y:187), radius: 150, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
                path.move(to: CGPoint(x:187, y:187))
            }
            .stroke(.black, lineWidth: 10)
            
        }

    }
}

#Preview {
    ContentView()
}
