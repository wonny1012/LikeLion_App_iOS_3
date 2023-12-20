//
//  ContentView.swift
//  DrawExample
//
//  Created by kwon ji won on 12/19/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                //                Ex1()
                HeartShape()
                    .fill(.red)
                    .frame(width: 230, height: 320)
                   
                
//                Ex3()
//                    .overlay(
//                        Ex3()
//                            .fill(.white)
//                            .stroke(Color.blue, lineWidth: 5) // 테두리 색 및 두께
//                    )
//                    .frame(width: 300, height: 300)
                
                //                                ShapeView()
                //                Ex1View()
                //                    .fill(.yellow)
                //                GradientView()
                //
                //                PathView()
                //                Spacer().frame(height: 350)
                //                MyShape()
                //                    .fill(.red)
                //                    .frame(width: 360, height: 350)
                //
            }
            .padding()
        }
    }
}

struct GradientView: View {
    
    let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Gradient")
                Circle()
                    .fill(.blue.gradient)
                    .frame(width: 200, height: 200)
                
                Text("Drop Shadow")
                Circle()
                    .fill(.blue.shadow(.drop(color: .black, radius: 2)))
                    .frame(width: 200, height: 200)
                
                Text("Inner Shadow")
                Circle()
                    .fill(.blue.shadow(.inner(color: .yellow, radius: 10)))
                    .frame(width: 200, height: 200)
                
                Text("방사형 Gradient")
                Circle()
                    .fill(RadialGradient(gradient: colors, center: .center, startRadius: CGFloat(0), endRadius: CGFloat(100)))
                    .frame(width: 200, height: 200)
                
                Text("방사형 그레이디언트")
                Circle()
                    .fill(RadialGradient(gradient: colors,
                                         center: .center,
                                         startRadius: CGFloat(0),
                                         endRadius: CGFloat(100)))
                    .frame(width: 200, height: 200)
                
                Text("원뿔형 그레이디언트")
                Circle()
                    .fill(AngularGradient(gradient: colors,
                                          center: .center))
                    .frame(width: 200, height: 200)
                
                Text("선형 그레이디언트")
                Circle()
                    .fill(LinearGradient(gradient: colors,
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 200, height: 200)
                
                Text("fill, background 그레이디언트 적용")
                MyShape()
                    .fill(RadialGradient(gradient: colors,
                                         center: .center,
                                         startRadius: CGFloat(0),
                                         endRadius: CGFloat(300)))
                    .background(LinearGradient(gradient: colors,
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    .frame(width: 200, height: 200)
            }
            .padding()
        }
    }
}

struct Ex1: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 10))
            path.addLine(to: CGPoint(x: 10, y: 60))
            path.addLine(to: CGPoint(x: 350, y: 60))
            path.addLine(to: CGPoint(x: 350, y: 10))
            path.addLine(to: CGPoint(x: 320, y: 10))
            path.addQuadCurve(to: CGPoint(x: 30, y: 10), control: CGPoint(x: 180, y: -40))
            path.closeSubpath()
        }
        .fill(.purple)
        .overlay(
            Path {  path in
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: 10, y: 60))
                path.addLine(to: CGPoint(x: 350, y: 60))
                path.addLine(to: CGPoint(x: 350, y: 10))
                path.addLine(to: CGPoint(x: 320, y: 10))
                path.addQuadCurve(to: CGPoint(x: 30, y: 10), control: CGPoint(x: 180, y: -40))
                path.closeSubpath()
            }
                .stroke(Color.black, lineWidth: 5)
        )
    }
}
struct Ex1CruveView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
            .fill(.purple)

            Path { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
            .stroke(.black, lineWidth: 5)
        }
    }
}

struct Ex3: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 정삼각형의 한 변의 길이 계산
        let sideLength = min(rect.width, rect.height)
        
        // 정삼각형의 세 꼭짓점 계산
        let x1 = rect.midX
        let y1 = rect.midY
        
        let x2 = rect.midX - cos(60 * .pi / 180) * sideLength
        let y2 = rect.midY + sin(60 * .pi / 180) * sideLength
        
        let x3 = rect.midX + cos(60 * .pi / 180) * sideLength
        let y3 = rect.midY + sin(60 * .pi / 180) * sideLength
        
        // 시작점 설정
        path.move(to: CGPoint(x: x1, y: y1))
        
        // 꼭짓점을 연결하는 선 추가
        path.addLine(to: CGPoint(x: x2, y: y2))
        path.addLine(to: CGPoint(x: x3, y: y3))
        
        // 시작점으로 선을 추가하여 정삼각형 완성
        path.closeSubpath()
        
        return path
    }
    
}

struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // 하트의 중간 부분
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))

        // 왼쪽 상단 부분 (반원)
        
        path.addArc(
            center: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.minY + rect.height * 0.5),
                    radius: rect.width * 0.25,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 180),
                    clockwise: true
                )

        // 왼쪽 하단 부분
        path.addCurve(
                    to: CGPoint(x: rect.midX, y: rect.maxY),
                    control1: CGPoint(x: rect.minX, y: rect.midY + rect.height * 0.3),
                    control2: CGPoint(x: rect.midX - rect.width * 0.2, y: rect.maxY)
                )

        // 오른쪽 상단 부분
        path.addCurve(
            to: CGPoint(x: rect.maxX,y: rect.minY + rect.height * 0.5 ),
            control1: CGPoint(x: rect.midX + rect.width * 0.2, y: rect.maxY),
               control2: CGPoint(x: rect.maxX, y: rect.midY + rect.height * 0.3)
        )
        
        // 오른쪽 상단 부분
        path.addArc(
            center: CGPoint(x: rect.maxX - rect.width * 0.25, y: rect.minY + rect.height * 0.5),
            radius: rect.width * 0.25,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 180),
            clockwise: true
        )
        
        path.closeSubpath()
        return path
    }
}







struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to:CGPoint(x:10, y:10))
            path.addLine(to: CGPoint(x: 10, y:350))
            path.addLine(to: CGPoint(x: 300, y:300))
            path.addQuadCurve(to: CGPoint(x:200, y:200), control: CGPoint(x: 250, y: 250))
            path.closeSubpath()
        }
        .fill(.green)
    }
    
}


struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ShapeView: View {
    var body: some View {
        VStack {
            Text("기본 도형")
            
            Rectangle()
            
            Circle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            Capsule()
            //                .fill(.blue)
                .stroke(lineWidth: 10)
                .foregroundStyle(.blue)
                .frame(width: 200, height: 100)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10), CGFloat(20)]))
                .foregroundStyle(.blue)
                .frame(width: 200, height: 100)
            
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 20,
                                           dash: [CGFloat(10), CGFloat(5), CGFloat(2)],
                                           dashPhase: 10))
                .foregroundStyle(.blue)
                .frame(width: 250, height: 150)
            
            Text("테두리 오버레이 사용")
            Ellipse()
                .fill(.red)
                .overlay {
                    Ellipse()
                        .stroke(.blue, lineWidth: 10)
                }
                .frame(width: 250, height: 150)
            
        }
        .padding()
    }
}
