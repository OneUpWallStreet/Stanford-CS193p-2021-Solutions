
import Foundation
import SwiftUI



class EmojiMemoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    
//   Static keyword makes it global but can still be accessed usig EmojiMemoryGame.emojis
    static let emojis = ["👻","📝","🚫","😀","😔","😗","😋","🐸","🐮","🙈","🐧","🐢","🐍","🦎","🦕","🦖","🦀","🐊","🦈","🐋","🐳","🐬","🦓","🦍","🐘","🐃","🐎","🐏","🦙","⚽️","🦏","🦛","🦒","🐐","🐩","🦮","🦤","🐈‍⬛"]
    
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 15) { pairIndex in
            emojis[pairIndex]
        }
        
        
        
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    func choose(card: Card){
        model.choose(card: card)
    }
    
    
    
}

