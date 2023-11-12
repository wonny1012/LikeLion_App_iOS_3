//
//  NavigationSplitView_1.swift
//  NavigationSplitView
//
//  Created by kwon ji won on 11/8/23.
//

import SwiftUI

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}



struct NavigationSplitView_1: View {
    @State private var categories = [
           IconCategory(categoryName: "Folders", images: ["questionmark.folder.ar",
                                                          "questionmark.folder",
                                                          "questionmark.folder.fill.ar",
                                                          "folder.fill.badge.gear",
                                                          "questionmark.folder.fill"]),
           IconCategory(categoryName: "Circles", images:
                           ["book.circle",
                            "books.vertical.circle",
                            "books.vertical.circle.fill",
                            "book.circle.fill",
                            "book.closed.circle"]),
           IconCategory(categoryName: "Clouds", images:
                           ["cloud.rain",
                            "cloud",
                            "cloud.drizzle.fill",
                            "cloud.fill",
                            "cloud.drizzle"])

       ]
    //목록에서 현재 선택한 항목을 저장할 상태 변수 추가
    @State private var selectedCategory: IconCategory?
    @State private var selectedImage: String?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            //사이드바 목록
            List(categories, selection: $selectedCategory) { category in
                ///클릭 하려면 tag(category)
                Text(category.categoryName).tag(category)
            }
        } content: {
            //콘텐츠 목록
            if let selectedCategory {
                List(selectedCategory.images, id: \.self, selection: $selectedImage) {
                    image in
                    HStack {
                        Image(systemName: image)
                        Text(image)
                    }
                    .tag(image)
                }
            } else {
                Text("Select a category")
            }
        } detail: {
            //디테일 열
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Select a image")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }

}

#Preview {
    NavigationSplitView_1()
}
