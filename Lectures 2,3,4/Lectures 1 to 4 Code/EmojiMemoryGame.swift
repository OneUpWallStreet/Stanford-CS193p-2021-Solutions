import Foundation
import SwiftUI



class EmojiMemoryGame: ObservableObject{
    
//   Static keyword makes it global but can still be accessed usig EmojiMemoryGame.emojis
    static let emojis = ["ðŧ","ð","ðŦ","ð","ð","ð","ð","ðļ","ðŪ","ð","ð§","ðĒ","ð","ðĶ","ðĶ","ðĶ","ðĶ","ð","ðĶ","ð","ðģ","ðŽ","ðĶ","ðĶ","ð","ð","ð","ð","ðĶ","â―ïļ","ðĶ","ðĶ","ðĶ","ð","ðĐ","ðĶŪ","ðĶĪ","ðââŽ"]
    
    
    
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
