//
//  Example_5.swift
//  List
//
//  Created by kwon ji won on 11/1/23.
//

import SwiftUI

struct Example_5: View {
    
    
    struct Item: Identifiable {
        let id = UUID()
        let image: String
        let text: String
    }
    
    @State var items = [
        Item(image: "applelogo", text: "Apple"),
        Item(image: "swift", text: "Swift"),
        Item(image: "xcode", text: "Xcode"),
        Item(image: "macos", text: "maxOS"),
        Item(image: "ios", text: "iOS")
    ]
    
    var body: some View {
        Text("")
            .font(.largeTitle)
            .padding()
        
                NavigationStack {
        List {
            ForEach(items) { item in
                HStack {
                    Text("Item \(item.text)")
                    
                }
                
            }
            .onDelete(perform: { indexSet in
                items.remove(atOffsets: indexSet)
            })
            .onMove(perform: { indices, newOffset in
                items.move(fromOffsets: indices, toOffset: newOffset)
            })
        }
        .navigationTitle("SwiftUI List Quiz")
        .toolbar { EditButton() }
    }
    }
}

#Preview {
    Example_5()
}
