//
//  ContentView.swift
//  Mentoring_Example
//
//  Created by kwon ji won on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    ///비밀번호와 이메일이 맞게 작성됐는지 확인
    @State private var isEmailValid = false
    @State private var isPasswordValid = false
    @State private var showPassword = false
    ///버튼 활성화
    //    @State private var buttonToggle = false
    @State private var loginValid = false
    ///팝업띄우기
    @State private var showingAlert = false
    @State private var nextView = false
    
    
    
    var body: some View {
        NavigationStack {
            ZStack() {
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 20)
                    RoundedRectangle(cornerRadius: 40)
                        .fill(customColor())
                        .edgesIgnoringSafeArea(.bottom)
                }
                
                VStack(alignment: .leading, spacing: 40) {
                    Spacer()
                    Text("Hello \nWorld!")
                        .font(.system(size: 45))
                        .bold()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("이메일")
                            .font(.headline)
                        HStack {
                            TextField("이메일을 입력해주세요", text: $email)
                                .onChange(of: email) {
                                    isEmailValid =  isValidemail(email)
                                }
                            if !isEmailValid && email.count != 0 {
                                Image(systemName: "exclamationmark.circle")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(isEmailValid || email.count == 0 ? Color.clear : Color.red)
                        .cornerRadius(10)
                        
                        if !isEmailValid && email.count != 0{
                            Text("이메일을 올바르게 입력해주세요")
                                .foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("비밀번호")
                        HStack {
                            if showPassword {
                                TextField("비밀번호를 입력해주세요", text: $password)
                                    .onChange(of: password){ }
                            } else {
                                SecureField("비밀번호를 입력해주세요", text: $password)
                                    .onChange(of: password){
                                    }
                            }
                            
                            Button(action: {
                                self.showPassword.toggle()
                            }, label: {
                                Image(systemName: "eye.slash")
                                    .foregroundColor(.black)
                            })
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        //비밀번호 강도를 나타내는 상자
                        PasswordStrongView(password: $password)
                        Text("Helper text")
                    }
                    NavigationLink(destination: SuccessView(email: $email), isActive: $nextView) {
                        EmptyView()
                    }
                    Button {
                        //아이디 비번 일치하는지 확인하는 함수호출
                        LoginValid(email,password)
                        if isEmailValid && isPasswordValid {
                            nextView = true
                            print("로그인 성공")
                        } else {
                            //로그인 실패시 비밀번호만 리셋
                            self.showingAlert.toggle()
                            password = ""
                        }
                    }
                label: {
                    if ButtonValid() {
                        Text("로그인")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    } else {
                        Text("로그인")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .disabled(!ButtonValid())
                .alert(isPresented: $showingAlert){
                    Alert(title: Text("경고"), message: Text("아이디 혹은 비밀번호가 맞지 않습니다."))
                }
                    
                    Spacer()
                    Spacer()
                }
                .padding()
            }
        }
    }
    
    //배경 색상 커스텀
    func customColor() -> Color {
        return Color(UIColor(red: 0.796, green: 0.867, blue: 1.000, alpha: 1))
    }
    
    //    이메일 정규식
    func isValidemail(_ input: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
    //
    
    
    
    //버튼 활성화 (메일이 잘 작성 되어있고 비번이 2칸 이상일때)
    func ButtonValid() -> Bool {
        if password.count >= 2 && isEmailValid {
            return true
        } else {
            return false
        }
    }
    
    //아이디,비밀번호 확인
    func LoginValid(_ email: String, _ pass: String) {
        if email == "ohtt@apple.com" && pass == "happyswift1!" {
            isEmailValid = true
            isPasswordValid = true
            
        }
    }
}


#Preview {
    ContentView()
}
