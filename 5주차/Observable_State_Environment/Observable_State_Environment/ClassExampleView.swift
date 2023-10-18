//
//  ClassExampleView.swift
//  Observable_State_Environment
//
//  Created by kwon ji won on 2023/10/13.
//

import SwiftUI

struct ClassExampleView: View {
    
    //입력받을거
    @State private var 귤갯수: Int = 0
    @State private var 박스용량: Int = 0
    
    //출력할거
    @State private var 박스수: Int = 0
    @State private var 남은귤수: Int = 0
    
    //UI에 필요한 것
    let 제목: String = "귤을 박스에 \n나누어 담는\n계산기"

    var body: some View{
        VStack {
            Text(제목)
                .font(.system(size: 50))
                .fontWeight(.bold)
                .frame(minWidth: 350, alignment: .leading)
            
            //입력받을거
            Group {
                Label("귤의 총 갯수", systemImage: "")
                    .frame(minWidth: 370, alignment: .leading)
                
                TextField("귤갯수", value: $귤갯수, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 40)
                
                Label("박스의 크기", systemImage: "")
                    .frame(minWidth: 370, alignment: .leading)
                
                TextField("박스용량", value: $박스용량, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 40)
            }
            .padding(.horizontal, 20)
            
            //출력할거
            Text("필요한 박스수는 \(박스수)개 입니다.")
                .frame(minWidth: 350, alignment: .leading)
            Text("남은 귤 수는 \(남은귤수)개 입니다.")
                .frame(minWidth: 350, alignment: .leading)
                .padding(.bottom, 40)

            //계산버튼
            HStack {
                Button(action: {
                    //계산하는 기능(함수)
                    귤계산(귤수: 귤갯수, 박스크기: 박스용량)
                }, label: {
                    Text("귤 수 계산")
                })
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
            .padding(.leading, 20)
            
        }
    }
    
    func 귤계산(귤수: Int, 박스크기: Int ) -> Void {
        //계산식
        let 계산한박스수: Int = 귤수 / 박스크기
        let 계산한남은귤수: Int = 귤수 % 박스크기
        
        박스수 = 계산한박스수
        남은귤수 = 계산한남은귤수
    }
}

struct ClassExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ClassExampleView()
    }
}
