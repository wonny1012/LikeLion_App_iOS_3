//
//  ContentView.swift
//  GridRow
//
//  Created by kwon ji won on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = []
    @State private var selectedCards: [Card] = []
    
    struct Card: Identifiable {
        let id: Int
        let symbol: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
    init() {
        var symbols = ["suit.heart", "suit.diamond", "suit.spade", "suit.club"]
        symbols += symbols // Duplicate to create matching pairs
        symbols.shuffle()
        
        for index in 0..<symbols.count {
            cards.append(Card(id: index, symbol: symbols[index]))
        }
    }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
                ForEach(cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            if !card.isMatched {
                                select(card)
                            }
                        }
                }
            }
        }
    }
    
    func select(_ card: Card) {
        if selectedCards.count == 2 {
            // Two cards are already selected, flip them back over
            for card in selectedCards {
                if !card.isMatched {
                    cards[card.id].isFaceUp = false
                }
            }
            selectedCards.removeAll()
        }
        
        cards[card.id].isFaceUp = true
        selectedCards.append(card)
        
        if selectedCards.count == 2 {
            // Check if the selected cards match
            if selectedCards[0].symbol == selectedCards[1].symbol {
                cards[selectedCards[0].id].isMatched = true
                cards[selectedCards[1].id].isMatched = true
            }
        }
    }
}

struct CardView: View {
    var card: ContentView.Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(card.isMatched ? .blue : (card.isFaceUp ? .white : .red))
            Text(card.isFaceUp ? card.symbol : "")
                .font(.largeTitle)
        }
        .aspectRatio(1.0, contentMode: .fit)
    }
}



//struct ContentView: View {
//    var body: some View {
//        Grid(horizontalSpacing: 30) {
//            GridRow {
//                ForEach(1...5, id: \.self) { index in
//                    CellContent2(index: index, color: .red)
//                }
//            }
//            
//            GridRow {
//                ForEach(6...10, id: \.self) { index in
//                    CellContent2(index: index, color: .blue)
//                }
//            }
//            
//            GridRow {
//                ForEach(11...12, id: \.self) { index in
//                    CellContent2(index: index, color: .green)
//                }
//            }
//            CellContent2(index: 16, color: .blue)
//            
//            GridRow {
//                CellContent2(index: 17, color: .orange)
//                    .gridCellColumns(2)
//                CellContent2(index: 17, color: .orange)
//                    .gridCellColumns(1)
//            }
//        }
//        .padding()
//    }
//}
//
//
//struct CellContent1: View {
//    var index: Int
//    var color: Color
//
//    var body: some View {
//        Text("\(index)")
//            .frame(minWidth: 75, maxWidth: 100, minHeight: 50, maxHeight: .infinity)
//            .background(color)
//            .cornerRadius(8)
//            .font(.largeTitle)
//
//    }
//}
//
//
////셀 동작하는 커스텀 뷰를 추가
//struct CellContent2: View {
//    var index: Int
//    var color: Color
//
//    var body: some View {
//        Text("\(index)")
//            .frame(minWidth: 75, maxWidth: .infinity, minHeight: 100)
//            .background(color)
//            .cornerRadius(8)
//            .font(.largeTitle)
//
//    }
//}
//
//
//#Preview {
//    ContentView()
//}
