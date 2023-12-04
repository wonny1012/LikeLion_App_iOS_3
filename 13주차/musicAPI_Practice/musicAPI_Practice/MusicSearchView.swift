//
//  MusicSearchView.swift
//  musicAPI_Practice
//
//  Created by kwon ji won on 12/4/23.
//

import Foundation
import SwiftUI

//서치바 만들기
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "magnifyingglass")
                
                TextField("Search", text: $text)
                    .foregroundColor(.primary)
                
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

struct SearchView: View {
    
    @State private var searchText = ""

    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

//
