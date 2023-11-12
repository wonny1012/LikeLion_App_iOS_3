//
//  ContentView.swift
//  TeamProject
//
//  Created by kwon ji won on 11/9/23.
//
import SwiftUI

struct Card: Identifiable, Hashable {
  var id = UUID()
  var name: String
  var imageName: String
  var isOnOff: Bool = false
  var isCompleted: Bool = false
}

let datas = [
  Card(name: "suit.heart", imageName: "suit.heart"),
  Card(name: "suit.diamond", imageName: "suit.diamond"),
  Card(name: "suit.spade", imageName: "suit.spade"),
  Card(name: "suit.club", imageName: "suit.club"),
  Card(name: "folder", imageName: "folder"),
  Card(name: "mic", imageName: "mic"),
  Card(name: "pencil", imageName: "pencil"),
  Card(name: "paperplane", imageName: "paperplane"),
  Card(name: "suit.heart", imageName: "suit.heart"),
  Card(name: "suit.diamond", imageName: "suit.diamond"),
  Card(name: "suit.spade", imageName: "suit.spade"),
  Card(name: "suit.club", imageName: "suit.club"),
  Card(name: "folder", imageName: "folder"),
  Card(name: "mic", imageName: "mic"),
  Card(name: "pencil", imageName: "pencil"),
  Card(name: "paperplane", imageName: "paperplane"),
]


struct ContentView: View {
  @State private var data = datas.shuffled()
  @State private var answer: [Card] = []
  @State private var checkArr: [Card] = []
  
  var body: some View {
    VStack {
        Text("짝 맞추기 게임")
            .font(.system(size: 30, weight: .bold))
        Text("클릭 하여 같은 모양을 찾아보세요!")
      LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 4) {
        ForEach(data) { card in
          CardView(card: card)
            .onTapGesture {
              if !card.isCompleted {
                flipCard(card)
              }
            }
        }
      }
      .padding()
      
      Button {
        data = datas.shuffled()
      } label: {
        Text("게임 다시 시작하기")
      }
      .frame(maxWidth: 300, minHeight: 50)
                  .background(Color.blue)
                  .foregroundColor(.white)
                  .cornerRadius(8)
                  .padding()
//      .padding(.top, 20)
    }
  }
  
  
  func flipCard(_ card: Card) {
    let index = data.firstIndex(of: card)!
    data[index].isOnOff.toggle()
    
    if !checkArr.isEmpty && checkArr[0].id == card.id {
      checkArr = []
      return
    }
    
    checkArr.append(card)
    
    if checkArr.count == 2 {
      doCheckAnswer()
    }
  }
  
  func doCheckAnswer() {
    let card1 = checkArr[0]
    let card2 = checkArr[1]
    
    changeCardState(card1, card2)
    checkArr = []
  }
  
  func changeCardState(_ card1: Card, _ card2: Card) {
    let card1Index = getDataIndex(card1)
    let card2Index = getDataIndex(card2)
    
    if card1.name == card2.name {
      data[card1Index].isCompleted = true
      data[card2Index].isCompleted = true
    } else {
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        data[card1Index].isOnOff = false
        data[card2Index].isOnOff = false
      }
    }
  }
  
  func getDataIndex(_ card: Card) -> Int {
    let card = data.filter{ $0.id == card.id }
    let cardIndex = data.firstIndex(of: card[0])!
    return cardIndex
  }
}

struct CardView: View {
  
  var card: Card
  
  var body: some View {
    VStack {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
              .foregroundColor(card.isCompleted ? .blue : (card.isCompleted ? .white : Color(UIColor(red: 0.796, green: 0.867, blue: 1.000, alpha: 1))))
        Image(systemName: card.isOnOff ? card.imageName : "questionmark.circle")
          .resizable()
          .frame(width: 50, height: 50)
      }
      .aspectRatio(1.0, contentMode: .fit)
    }
  }
}

#Preview {
  ContentView()
}

//struct ContentView: View {
//    
//    @State private var cards: [Card] = []
//    @State private var selectedCards: [Card] = []
//
//    var body: some View {
//
//        LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 4) {
//            ForEach((0..<cards.count), id: \.self) { index in
//                CardView(card: cards[index])
//                    .onTapGesture {
//                        
//                    }
//            }
//        }
//        .padding()
//        .task {
//            var symbols = ["suit.heart", "suit.diamond", "suit.spade", "suit.club", "mic", "folder" ,"pencil","paperplane"]
//            symbols += symbols
//            symbols.shuffle()
//            
//            for index in 0..<16 {
//                cards.append(Card(id: index, symbol: symbols[index]))
//            }
//        }
//    }
//}
//
//struct Card: Identifiable {
//    let id: Int
//    let symbol: String
//    var isCardOpen: Bool = false
//    var isCardMatch: Bool = false
//}
//
//struct CardView: View {
//    
//    var card: Card
//    
//    var body: some View {
//        VStack {
//            
//            ZStack {
//                RoundedRectangle(cornerRadius: 12)
//                    .foregroundColor(card.isCardMatch ? .blue : (card.isCardOpen ? .white : .red))
//                Image(systemName: card.isCardOpen ? card.symbol : " ")
//                    .resizable()
//            }
//            .aspectRatio(1.0, contentMode: .fit)
//        }
//    }
//}

 


//struct ContentView: View {
//    @State private var cards: [Card] = []
//    @State private var selectedCards: [Card] = []
//    private var gridItems = [GridItem(), GridItem(.flexible()), GridItem()]
//    
//    struct Card: Identifiable {
//        let id: Int
//        let symbol: String
//        var isCardOpen: Bool = false
//        var isCardMatch: Bool = false
//    }
//    
//    var body: some View {
//        VStack {
//            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
//                ForEach(cards) { card in
//                    CardView(card: card)
//                        .onTapGesture {
//                            // Handle tap gesture
//                        }
//                }
//            }
//        }
//        .onAppear {
//            loadCards()
//        }
//    }
//    
//    func loadCards() {
//        // 비동기 작업을 수행하여 카드를 초기화
//        DispatchQueue.global().async {
//            var symbols = ["suit.heart", "suit.diamond", "suit.spade", "suit.club", "mic", "folder", "pencil", "paperplane"]
//            symbols += symbols
//            symbols.shuffle()
//            
//            for index in 0..<15 {
//                cards.append(Card(id: index, symbol: symbols[index]))
//            }
//        }
//    }
//}
//
//struct CardView: View {
//    var card: ContentView.Card
//    
//    var body: some View {
//        VStack {
//            Text("\(card.symbol)")
//            ZStack {
//                RoundedRectangle(cornerRadius: 12)
//                    .foregroundColor(card.isCardMatch ? .blue : (card.isCardOpen ? .black : .red))
//                Image(systemName: "\(card.symbol)")
//                    .resizable()
//            }
//            .aspectRatio(1.0, contentMode: .fit)
//        }
//    }
//}

//import SwiftUI
//
//struct ContentView: View {
//    
//    
//    @State private var cards: [Card] = []
//    @State private var selectedCards: [Card] = []
//    private var gridItems = [GridItem(),
//                               GridItem(.flexible()),
//                               GridItem(),
//      ]
//
//    struct Card: Identifiable {
//        let id: Int
//        let symbol: String
//        var isCardOpen: Bool = false
//        var isCardMatch: Bool = false
//    }
//    
//    init() {
//        var symbols = ["suit.heart", "suit.diamond", "suit.spade", "suit.club", "mic", "folder" ,"pencil","paperplane"]
//        symbols += symbols
//        symbols.shuffle()
//        
//        for index in 0..<15 {
//            cards.append(Card(id: index, symbol: symbols[index]))
//        }
//    }
//
//    
//    var body: some View {
//        VStack {
//            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
//                ForEach((cards)) { card in
//                                CardView(card: card)
//                        .onTapGesture {
//                            
//                        }
//                }
//            }
//        }
//    }
//}
//
//struct CardView: View {
//    
//    var card: ContentView.Card
//    
//    var body: some View {
//        VStack {
//            Text("\(card.symbol)")
//            ZStack {
//                RoundedRectangle(cornerRadius: 12)
//                    .foregroundColor(card.isCardMatch ? .blue : (card.isCardOpen ? .black : .red))
//                Image(systemName: "\(card.symbol)")
//                    .resizable()
//            }
//            .aspectRatio(1.0, contentMode: .fit)
//        }
//    }
//}

#Preview {
    ContentView()
}
