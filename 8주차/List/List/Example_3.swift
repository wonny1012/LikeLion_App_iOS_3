//
//  Example_3.swift
//  List
//
//  Created by kwon ji won on 11/1/23.
//

import SwiftUI

struct Example_3: View {
    
    //    @State var selectedRow: Int? = nil
    
    //    var body: some View {
    //        Text("SwiftUI List Quiz")
    //            .font(.largeTitle)
    //            .padding()
    //        List(1...10, id: \.self) { Index in
    //            HStack {
    //                Text("Item\(Index)")
    //                Spacer()
    //                Image(systemName: selectedRow == Index ? "checkmark" : "")
    //                    .foregroundStyle(.blue)
    //            }
    //            .onTapGesture {
    //                print(selectedRow)
    //                if selectedRow == Index {
    //                    selectedRow = nil
    //                } else {
    //                    selectedRow = Index
    //                }
    //            }
    //
    //        }
    //        .background(Color.white)
    //    }
    
    struct Item: Identifiable {
        let id = UUID()
        let image: String
        let text: String
    }
    
    let items = [
        Item(image: "applelogo", text: "Apple"),
        Item(image: "swift", text: "Swift"),
        Item(image: "xcode", text: "Xcode"),
        Item(image: "macos", text: "maxOS"),
        Item(image: "ios", text: "iOS")
    ]
    
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        Text("\(multiSelection.count) selections")
            .font(.largeTitle)
            .padding()
        NavigationStack {
            List(items, selection: $multiSelection) { item in
                HStack{
                    Text("Item \(item.text)")
                    Image(systemName: item.image)
                }
        }
            .navigationTitle("SwiftUI List Quiz")
            .toolbar{ EditButton() }
        }
        
    }
}

#Preview {
    Example_3()
}
