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
    
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{cards.indices.filter({ cards[$0].isFaceUp==true}).oneAndOnly}
        set{cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}}
    }
    
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
                
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }

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
        var isFaceUp = false
        var isMatched = false
        var content: CardContent //Dont Care i.e. Generic
        
        
    }
    
}

extension Array {
    
    var oneAndOnly: Element? {
        if self.count==1{
            return self.first
        }
        else{
            return nil
        }
    }
}


