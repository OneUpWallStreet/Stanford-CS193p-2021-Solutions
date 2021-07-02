//
//  MemoryGame.swift
//  Memorize
//
//  Created by Arteezy on 6/30/21.
//

import Foundation

//CardContent is a generic
struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    
    private var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    mutating func choose(card: Card){
        
        if let chosenIndex = cards.firstIndex(where: { CardMatched in CardMatched.id == card.id}),
           cards[chosenIndex].isMatched == false,
           cards[chosenIndex].isFaceUp == false
           {
            
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard{

                if(cards[potentialMatchIndex].content == cards[chosenIndex].content){
                    
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true

                }
                
                indexOfOneAndOnlyFaceUpCard = nil
                
                
            }else{
                
                for index in cards.indices{
                    
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            
            
            cards[chosenIndex].isFaceUp.toggle()
        }
        else{
            print("Error")
        }
    }
    
    
    
    
    func index(of SelectedCard: Card) -> Int?{
        
//        var indexOfCard: Int?
        
        
        
        let lenArr: Int = cards.count
        for index in 0...lenArr{
            let tempCard = cards[index]
            if(tempCard.id==SelectedCard.id){
                return index
            }
        }
        return nil //bogus!
    }
    
    
    
    
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        
        cards = Array<Card>()
//        Numbers of Pairs * 2 paris of cards
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2,content: content))
            cards.append(Card(id: pairIndex*2+1,content: content))
        }
    }
    
//   Card is nested because we want the card to be used only in memory game
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //Dont Care i.e. Generic
        
        
    }
    
}
