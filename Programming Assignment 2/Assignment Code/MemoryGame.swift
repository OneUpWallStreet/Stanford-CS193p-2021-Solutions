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
    
    var card_count: Array<Int> = []
    
    var score: Int = 0
    
//    array.filter{$0 == element}.count
    
    
    private var indexOfOneAndOnlyFaceUpCard: Int?

    mutating func choose(card: Card){
        
        
        if let chosenIndex = cards.firstIndex(where: { CardMatched in CardMatched.id == card.id}),
           cards[chosenIndex].isMatched == false,
           cards[chosenIndex].isFaceUp == false
           {
//            print("Chosen Index: ",chosenIndex)

            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard{

                if(cards[potentialMatchIndex].content == cards[chosenIndex].content){
                    
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    increaseScore(id_1: cards[chosenIndex].id, id_2: cards[potentialMatchIndex].id)
                    
                    
                
                }
                
                indexOfOneAndOnlyFaceUpCard = nil
                
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = chosenIndex
                
    

            }

            card_count.append(cards[chosenIndex].id)
            changeScore(id: cards[chosenIndex].id)
            cards[chosenIndex].isFaceUp.toggle()
            
            
        }
        else{
            print("Error")
        }
    }
    
    mutating func increaseScore(id_1: Int, id_2: Int){
        
        card_count.removeAll{$0 == id_1}
        card_count.removeAll{$0 == id_2}
        
        score = score + 2
        
        
        
    }
    
    mutating func changeScore(id: Int){
        
        let card_press_count = card_count.filter{$0 == id}.count
        
        if(card_press_count>1){
            score = score - 1
        }
        
        print("good 4 u")
        
    }
    
    mutating func resetScore(){
        score = 0
    }
    
    
    func index(of SelectedCard: Card) -> Int?{

        let lenArr: Int = cards.count
        for index in 0...lenArr{
            let tempCard = cards[index]
            if(tempCard.id==SelectedCard.id){
                return index
            }
        }
        return nil
    }

    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        
        cards = Array<Card>()
//        Numbers of Pairs * 2 paris of cards
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2,content: content))
            cards.append(Card(id: pairIndex*2+1,content: content))
        }
        
        cards = cards.shuffled()
        
    }
    
    
    
//   Card is nested because we want the card to be used only in memory game
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //Dont Care i.e. Generic
        
        
    }
    
    
}
