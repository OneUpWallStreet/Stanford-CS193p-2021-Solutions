//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Arteezy on 6/29/21.
//
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    @State private var dealt = Set<Int>()
    @Namespace private var dealingNamespace
    
    private func deal(_ card: EmojiMemoryGame.Card){
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool{
        !dealt.contains(card.id)
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                gameBody
                
                HStack{
                    restart
                    Spacer()
                    shuffle
                }.padding(.horizontal)
            }
            deckBody
        }

        
        }
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        
        var delay = 0.0
        if let index = game.cards.firstIndex(where: {$0.id == card.id}){
            
            delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
        }
        
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(card: EmojiMemoryGame.Card) -> Double {
        
        -Double(game.cards.firstIndex(where: {$0.id == card.id}) ?? 0)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3){ card in
                
            if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
                Color.clear
            }
            else{
                CardView(card)
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .padding(4)
                .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(zIndex(card: card))
                .onTapGesture {
                    withAnimation{
                        game.choose(card: card)

                    }
                }
                
            }
        }
        .foregroundColor(.red).padding(.horizontal)

    }
    
    
    var deckBody: some View {
        
        ZStack{
            
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .zIndex(zIndex(card: card))
            }
            
        }
        .frame(width: CardConstants.undealWidth, height: CardConstants.undealHeight)
        .foregroundColor(CardConstants.color)
        .onTapGesture {
            for card in game.cards{
                
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
                
            }
        }
        
    }
    
    var shuffle: some View {
        Button("Shuffle"){
            withAnimation(.easeInOut(duration: 1)){
                game.shuffle()
            }
        }
    }
    
    var restart: some View {
        Button("Restart"){
            withAnimation{
                dealt = []
                game.restart()
            }
        }
        
    }
    
    private struct CardConstants {
        
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealHeight: CGFloat = 90
        static let undealWidth = undealHeight * aspectRatio
    }
    

    
}



struct CardView: View{
    
    let card: EmojiMemoryGame.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View{
        
        GeometryReader { geometry in
            
            ZStack{
                Group{
                    if card.isConsumingBonusTime{
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animatedBonusRemaining)*360-90))
                            .onAppear{
                                animatedBonusRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)){
                                    animatedBonusRemaining = 0
                                }
                        }
                    }else{
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-card.bonusRemaining)*360-90))

                    }
                }.opacity(0.5).padding(5)



                    Text(card.content)
                        .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        .font(Font.system(size: DrawingConstants.fontSize))
                        .scaleEffect(scale(thatFits: geometry.size))
                        

                    
            }.cardify(isFaceUp: card.isFaceUp)
            }
        }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    
    private func font(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height)*DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants{
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards.first!)
        return EmojiMemoryGameView(game: game)

    }
}

