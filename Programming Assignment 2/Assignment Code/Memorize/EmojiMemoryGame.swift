//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Arteezy on 6/30/21.
//

import Foundation
import SwiftUI



class EmojiMemoryGame: ObservableObject{

    
    static var vehicles = ["✈️","🚗","🚔","🚚","🚜","🛳","🚝","🛻"]
    static var animals = ["🐳","🐋","🐊","🐍","🐢","🦛","🦕","🦖"]
    static var faces = ["🤣","😭","😜","😎","🥳","😡","🙄","😁"]
    
    
    static var visited_cards: Array<Int> = []
    
    
    var themes: Array<Theme>
    
    private(set) var nameOfTheme: String = "vehicles"
    
    static var current_theme = Theme(name: "vehicles", emojis: vehicles, numberOfPairs: 5, color: "red")
    
    private(set) var nameOfColor: String = current_theme.color
    
    struct Theme {
        var name: String
        var emojis: Array<String>
        var numberOfPairs: Int
        var color: String
            
    }

//    For making sure the number of cards dont go over the available cards
    var ThemeLen = ["vehicles":  vehicles.count,
                    "animals":  animals.count,
                    "faces": faces.count]
    

    init() {
            themes = Array<Theme>()

            themes.append(Theme(name: "vehicles", emojis: EmojiMemoryGame.vehicles, numberOfPairs: 10, color: "red"))
            themes.append(Theme(name: "animals", emojis: EmojiMemoryGame.animals, numberOfPairs: 5, color: "yellow"))
            themes.append(Theme(name: "faces", emojis: EmojiMemoryGame.faces, numberOfPairs: 2, color: "pink"))
        
        
//            Making sure the card limit is valid
            for index in themes.indices{
                if(themes[index].numberOfPairs>ThemeLen[themes[index].name]!){
                    themes[index].numberOfPairs = ThemeLen[themes[index].name]!
                }
                
            }
        
            self.shuffleThemes()
            self.assginRandomTheme()
      
    }
    
    func shuffleThemes(){
        for index in themes.indices{
            self.themes[index].emojis.shuffle()
        }
    }
    
    func newGame(){

        
        model.resetScore()
        self.shuffleThemes()
        self.assginRandomTheme()
        
        self.nameOfTheme = EmojiMemoryGame.current_theme.name
        self.nameOfColor = EmojiMemoryGame.current_theme.color
//        print("After Shuffle: ",EmojiMemoryGame.current_theme)
    }
    
    func assginRandomTheme(){
        EmojiMemoryGame.current_theme = self.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: EmojiMemoryGame.current_theme)
    }
    
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            theme.emojis[pairIndex]
        }
        
    }
    
    
    
    @Published var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(theme: EmojiMemoryGame.current_theme)

    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
        
    }
    
    
    func choose(card: MemoryGame<String>.Card){
//        model.score = 2
        print(model.score)
        model.choose(card: card)
    }
    
    
    
}

//            for x in themes.indices{
    //           Shuffle all the emojis
//                themes[x].emojis.shuffle()
//            }
            
    //        Select random theme at the start

//var didFind: Bool?
//
//for index in EmojiMemoryGame.visited_cards.indices{
//
//    if(EmojiMemoryGame.visited_cards[index]==card_id){
//        didFind = true
//        EmojiMemoryGame.visited_cards.remove(at: index)
//        break
//    }
//
//}
//
////        EmojiMemoryGame.visited_cards.r
//
//if(didFind==true){
//    score_model.decreaseScore()
//}

