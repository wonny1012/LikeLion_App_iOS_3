//
//  AniGradientView.swift
//  Animation
//
//  Created by kwon ji won on 12/20/23.
//

import SwiftUI

struct AniGradientView: View {
    var body: some View {
//        StartEndAniGradientView()
//        RadialAniGradientView()
        HueRotationAniGradientView()
    }
}

//시작점과 끝점을 변경하여 그라디언트에 애니메이션 적용
struct StartEndAniGradientView: View {
    
    @State private var animateGradient = false
    
    var body: some View {
        // 왼쪽 상단에서 오른족 하단으로 보라색과 노란색의 그라데이션
        LinearGradient(colors: [.purple,.yellow], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
            //전체 배경화면에 적용
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct RadialAniGradientView: View {

    @State private var animateGradient = false

    var body: some View {
        RadialGradient(colors: [.purple, .yellow],
                       center: .center,
                       startRadius: animateGradient ? 400 : 200,
                       endRadius:   animateGradient ? 20 : 40)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
        }
    }
}

struct HueRotationAniGradientView: View {

    @State private var animateGradient = true

    var body: some View {
        LinearGradient(colors: [.purple, .yellow],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        .hueRotation(.degrees(animateGradient ? 90 : 0))
        .onAppear {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
        }
    }
}

#Preview {
    AniGradientView()
}
