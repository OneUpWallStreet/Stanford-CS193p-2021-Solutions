//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Arteezy on 6/30/21.
//

import Foundation
import SwiftUI



class EmojiMemoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    
//   Static keyword makes it global but can still be accessed usig EmojiMemoryGame.emojis
    static let emojis = ["ðŧ","ð","ðŦ","ð","ð","ð","ð","ðļ","ðŪ","ð","ð§","ðĒ","ð","ðĶ","ðĶ","ðĶ","ðĶ","ð","ðĶ","ð","ðģ","ðŽ","ðĶ","ðĶ","ð","ð","ð","ð","ðĶ","â―ïļ","ðĶ","ðĶ","ðĶ","ð","ðĐ","ðĶŪ","ðĶĪ","ðââŽ"]
    
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 15) { pairIndex in
            emojis[pairIndex]
        }
        
        
        
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    func restart(){
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func shuffle(){
        
        model.shuffle()
        
    }
    
    func choose(card: Card){
        model.choose(card: card)
    }
    
    
    
}

