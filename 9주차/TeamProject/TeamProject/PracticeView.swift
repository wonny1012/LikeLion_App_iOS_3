//
//  PracticeView.swift
//  TeamProject
//
//  Created by kwon ji won on 11/9/23.
//

//import SwiftUI
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var cards: [Card] = []
//    @State private var selectedCards: [Card] = []
//    
//    struct Card: Identifiable {
//        let id: Int
//        let symbol: String
//        var isFaceUp: Bool = false
//        var isMatched: Bool = false
//    }
//    
//    init() {
//        var symbols = ["suit.heart", "suit.diamond", "suit.spade", "suit.club"]
//        symbols += symbols // Duplicate to create matching pairs
//        symbols.shuffle()
//        
//        for index in 0..<symbols.count {
//            cards.append(Card(id: index, symbol: symbols[index]))
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
//                ForEach(cards) { card in
//                    CardView(card: card)
//                        .onTapGesture {
//                            if !card.isMatched {
//                                select(card)
//                            }
//                        }
//                }
//            }
//        }
//    }
//    
//    func select(_ card: Card) {
//        if selectedCards.count == 2 {
//            // Two cards are already selected, flip them back over
//            for card in selectedCards {
//                if !card.isMatched {
//                    cards[card.id].isFaceUp = false
//                }
//            }
//            selectedCards.removeAll()
//        }
//        
//        cards[card.id].isFaceUp = true
//        selectedCards.append(card)
//        
//        if selectedCards.count == 2 {
//            // Check if the selected cards match
//            if selectedCards[0].symbol == selectedCards[1].symbol {
//                cards[selectedCards[0].id].isMatched = true
//                cards[selectedCards[1].id].isMatched = true
//            }
//        }
//    }
//}
//
//struct CardView: View {
//    var card: ContentView.Card
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(card.isMatched ? .blue : (card.isFaceUp ? .white : .red))
//            Text(card.isFaceUp ? card.symbol : "")
//                .font(.largeTitle)
//        }
//        .aspectRatio(1.0, contentMode: .fit)
//    }
//}
//
//@main
//struct CardMatchingGameApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//
//
//#Preview {
//    PracticeView()
//}
