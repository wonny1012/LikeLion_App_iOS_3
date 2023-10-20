//
//  ContentView.swift
//  Thread
//
//  Created by kwon ji won on 2023/10/19.
//

import SwiftUI

//동기 비동기
//struct ContentView: View {
//    var body: some View {
//        //동기 비동기
//        Button(action: {
//            Task {
//                await doSomething()
//            }
//        }, label: {
//            Text("Do Something")
//        })
//    }
//
//    func doSomething() async  {
//        print("Start \(Date())")
//        await takesTooLong()
//        print("End \(Date())")
//    }
//
//    func takesTooLong() async {
//        sleep(5)
//        print("Async task completed at \(Date())")
//    }
    
//    func doSomething() {
//        print("Start \(Date())")
//        takesTooLong()
//        print("End \(Date())")
//    }
//
//    func takesTooLong() {
//        sleep(5)
//        print("Async task completed at \(Date())")
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        //async-let
//        Button(action: {
//            Task {
//                await doSomething()
//            }
//        }, label: {
//            Text("Do Something")
//        })
//    }
//
//    func doSomething() async  {
//        print("Start \(Date())")
//        async let result = takesTooLong()
//        print("End \(await result)")
//        for i in 1...10 {
//            print(i)
//        }
//    }
//
//    func takesTooLong() async -> Date {
//        sleep(5)
//        print("Async task completed at \(Date())")
//        return Date()
//    }
//}


//오류 핸들링
enum DurationError: Error {
    case tooLong
    case tooShot
}

struct ContentView: View {
    var body: some View {
        //async-let
        Button(action: {
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }
    
    func doSomething() async  {
        print("Start \(Date())")
        do {
            try await takesTooLong(delay: 25)
        } catch DurationError.tooShot {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch {
            print("Unknwon error")
        }
           
        print("End \(Date())")
       
    }
    
    func takesTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShot
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        
        sleep(delay)
        print("Async task completed at \(Date())")
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
