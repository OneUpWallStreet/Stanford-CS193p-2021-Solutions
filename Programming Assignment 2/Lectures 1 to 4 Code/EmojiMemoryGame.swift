import Foundation
import SwiftUI



class EmojiMemoryGame: ObservableObject{
    
//   Static keyword makes it global but can still be accessed usig EmojiMemoryGame.emojis
    static let emojis = ["👻","📝","🚫","😀","😔","😗","😋","🐸","🐮","🙈","🐧","🐢","🐍","🦎","🦕","🦖","🦀","🐊","🦈","🐋","🐳","🐬","🦓","🦍","🐘","🐃","🐎","🐏","🦙","⚽️","🦏","🦛","🦒","🐐","🐩","🦮","🦤","🐈‍⬛"]
    
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    
    
}
