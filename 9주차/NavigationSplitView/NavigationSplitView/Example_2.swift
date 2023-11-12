//
//  Example_2.swift
//  NavigationSplitView
//
//  Created by kwon ji won on 11/8/23.
//

import SwiftUI

struct Item2: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var content: String
}

struct ListView: View {
    @State var items2: [Item2]
    @Binding var selectedItem: Item2?
    

    var body: some View {
        List(items2, selection: $selectedItem) { item in
            Text(item.title).tag(item)
        }
    }
}

struct DetailView: View {
    var item: Item2

    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
            Text(item.content)
                .padding()
        }
    }
}

struct Example_2: View {
    @State private var selectedItem: Item2?
    
    let items = [
        Item2(title: "첫 번째 항목", content: "이것은 첫 번째 항목입니다."),
        Item2(title: "두 번째 항목", content: "이것은 두 번째 항목입니다."),
        Item2(title: "세 번째 항목", content: "이것은 세 번째 항목입니다."),
        Item2(title: "네 번째 항목", content: "이것은 네 번째 항목입니다."),
        Item2(title: "다섯 번째 항목", content: "이것은 다섯 번째 항목입니다."),
        Item2(title: "여섯 번째 항목", content: "이것은 여섯 번째 항목입니다."),
        Item2(title: "일곱 번째 항목", content: "이것은 일곱 번째 항목입니다."),
        Item2(title: "여덟 번째 항목", content: "이것은 여덟 번째 항목입니다."),
        Item2(title: "아홉 번째 항목", content: "이것은 아홉 번째 항목입니다."),
        Item2(title: "열 번째 항목", content: "이것은 열 번째 항목입니다.")
    ]
    
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView {
            ListView(items2: items, selectedItem: $selectedItem)
        } detail: {
            if let selectedItem = selectedItem {
                DetailView(item: selectedItem)
            } else {
                Text("select the title")
            }
        }.navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    Example_2()
}
