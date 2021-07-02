//
//  ContentView.swift
//  Memorize
//
//  Created by Arteezy on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card: card)
                        }
                    }
                        
                    }.padding(.horizontal).foregroundColor(.red)
                }
    }
    
}



struct CardView: View{
    
    let card: MemoryGame<String>.Card
    
    var body: some View{
        
            ZStack(content: {
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content)
//                    Text(content).font(.largeTitle)
                }
                else if card.isMatched{
                    shape.opacity(0)
                }
                else{
                    shape.fill()
                }
            })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        
//        ContentView()
//            .preferredColorScheme(.light)
    }
}
