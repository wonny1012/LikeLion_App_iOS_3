//
//  FirstTabView.swift
//  LifeCycleEx
//
//  Created by kwon ji won on 2023/10/26.
//

import SwiftUI


struct FirstTabView:View {
    var body: some View {
        Text("View One")
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
            
    }
    func changeTitle() async -> String {
        sleep(5)
        return "비동기 완료"
        
    }
}
