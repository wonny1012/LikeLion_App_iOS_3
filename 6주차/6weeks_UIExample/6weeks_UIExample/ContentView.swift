//
//  ContentView.swift
//  6weeks_UIExample
//
//  Created by kwon ji won on 2023/10/16.
//

import SwiftUI


//버튼 디자인을 받아오는걸 생각해보자

struct ContentView: View {
    @State private var name: String = ""
    var body: some View {
        ZStack {
            Color.cyan
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("Image")
                //화면 사이즈에 맞춰서 조정하겠다.
                    .resizable()
                //비율을 맞춰라
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity, height: .infinity)
                    .cornerRadius(24)
                HStack {
                    //링크로 만드는 방법
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("Home")
                        Image(systemName: "house.circle")
                    })
                    Button("HOME") {
                  
                    }
                    .padding(5)
                    .buttonStyle(.bordered)
                    .background(Color.indigo)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    
                    Spacer()
                    Text("HELLO WORLD!")
                    Spacer()
                    Button {
                        let numberString = "01041773435"
                        let telephone = "tel://"
                        let formattedString = telephone + numberString
                        guard let url = URL(string: formattedString) else { return }
                        UIApplication.shared.open(url)
                       
                    } label: {
                        Text("CALL")
                    }
                    .padding(5)
                    .buttonStyle(.bordered)
                    .background(Color.indigo)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                }
                Spacer()
                HStack {
                    TextField("HELLO WORLD", text: $name)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        //nothing
                    } label: {
                        Text("HELLO BUTTON")
                    }
                    .buttonStyle(.bordered)
                    .background(Color.indigo)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
