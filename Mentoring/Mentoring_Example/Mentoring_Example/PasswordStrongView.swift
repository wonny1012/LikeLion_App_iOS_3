//
//  PasswordStrongView.swift
//  Mentoring_Example
//
//  Created by kwon ji won on 10/31/23.
//

import SwiftUI

//비밀번호
struct PasswordStrongView: View {
    @Binding var password: String
    
    var body: some View {
        HStack() {
            //비어있는 경우
            Rectangle()
                .fill(password.isEmpty ? Color.clear : Color.red)
                .frame(width: 80, height: 5)
            //8글자보다 클 경우
            Rectangle()
                .fill(password.count < 8 ? Color.clear : Color.orange)
                .frame(width: 80, height: 5)
            //숫자 하나랑 8자 이상 특수문자 하나 이상인 경우
            Rectangle()
                .fill(passwordThree(password) ? Color.yellow : Color.clear)
                .frame(width: 80, height: 5)
            Rectangle()
                .fill(passwordFour(password) ? Color.green : Color.clear)
                .frame(width: 80, height: 5)
        }
    }
    
    func passwordThree(_ input: String) -> Bool {
        //숫자 하나랑 8자 이상 특수문자 하나 이상
        let passwordThree = "^(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordThree).evaluate(with: input)
    }
    
    func passwordFour(_ input: String) -> Bool {
        let passwordFour = "^(?=.*[0-9])(?=.*[!@#$%^&*()_+=-].*[!@#$%^&*()_+=-]).{8,50}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordFour).evaluate(with: input)
    }
    
}


//#Preview {
//    PasswordStrongView(password: $passw)
//}
