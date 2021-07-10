
import Foundation
import SwiftUI

struct SetModel {
    
    var cards = Array<Card>()
    var cardIndexForId: Int = 0
    var doCardsMatch: Bool = false
    
//    This is to store the cards to filter them later
    var selectedCardsToRemove: Array<SelectedCards> = []

    mutating func checkMatchingCards(Selectedcards: Array<SelectedCards>) -> Bool{
        
        let indexCard1: Int = Selectedcards[0].index
        let indexCard2: Int = Selectedcards[1].index
        let indexCard3: Int = Selectedcards[2].index
        
        if
            (cards[indexCard1].color == cards[indexCard2].color && cards[indexCard3].color == cards[indexCard1].color && cards[indexCard2].color == cards[indexCard3].color)
            ||
            (cards[indexCard1].numberOfShapes == cards[indexCard2].numberOfShapes && cards[indexCard3].numberOfShapes == cards[indexCard1].numberOfShapes && cards[indexCard2].numberOfShapes == cards[indexCard3].numberOfShapes)
            ||
            (cards[indexCard1].shapeProperty == cards[indexCard2].shapeProperty && cards[indexCard3].shapeProperty == cards[indexCard1].shapeProperty && cards[indexCard2].shapeProperty == cards[indexCard3].shapeProperty)
            ||
            (cards[indexCard1].shape == cards[indexCard2].shape && cards[indexCard3].shape == cards[indexCard1].shape && cards[indexCard2].shape == cards[indexCard3].shape)
        {
//          Chaning so that they are coloured in green becuase all 3 matched
            cards[indexCard1].pairMatch = true
            cards[indexCard2].pairMatch = true
            cards[indexCard3].pairMatch = true
            
            selectedCardsToRemove = Selectedcards
            
            return true
        }
        else{
            return false
        }

    }
    
    func findIndex(card: Card) -> Int?{
        for index in cards.indices{
            if card.numberOfShapes == cards[index].numberOfShapes && card.color == cards[index].color && card.shape == cards[index].shape && card.shapeProperty == cards[index].shapeProperty{
                print("Index im removing at:  \(index) AND THE CARD is: \(card)")
                return index
            }
        }
        return nil
    }
    
    mutating func removeMatchingCards(){
        
        let indexOfMatchingCards = [selectedCardsToRemove[0].index,selectedCardsToRemove[1].index,selectedCardsToRemove[2].index]
        
        let cardsToRemove: Array<Card> = [cards[indexOfMatchingCards[0]],cards[indexOfMatchingCards[1]],cards[indexOfMatchingCards[2]]]
        for card in cardsToRemove{
            let indexToRemove = findIndex(card: card)
//            print(indexToRemove!)
            cards.remove(at: indexToRemove!)

        }
        
    }

    mutating func choose(card: Card){
        
//      If cards match than you remove the matching cards and select the new card
        if doCardsMatch == true {
            removeMatchingCards()
            doCardsMatch = false
            
            for index in cards.indices{
                
                if cards[index].isPicked == true{
                    print("In true btw Card no: \(cards[index].numberOfShapes) And Card Col: \(cards[index].color ) AND property: \(cards[index].shapeProperty)")
                }
                
            }
        }
        
        var indexOfChosenCard: Int?
        var cardsAlreadySelected: Array<SelectedCards> = []
        
        

//       Selects the one card which is tapped on
        for index in cards.indices{
            if card.numberOfShapes == cards[index].numberOfShapes && card.color == cards[index].color && card.shape == cards[index].shape && card.shapeProperty == cards[index].shapeProperty{
                indexOfChosenCard = index
                print("\n")
                print("Card no: \(cards[indexOfChosenCard!].numberOfShapes) And Card Col: \(cards[indexOfChosenCard!].color ) AND property: \(cards[indexOfChosenCard!].shapeProperty)")
                print("\n")
            }
        }
        
//      Check how many cards are already selected
        for index in cards.indices{
            if cards[index].isPicked==true{
                cardsAlreadySelected.append(SelectedCards(index: index))
                print("Card picked up: \(cards[index].numberOfShapes) And Card Col: \(cards[index].color ) AND property: \(cards[index].shapeProperty)")
            }
        }
        print("indexOfChosenCard: ")
        cardsAlreadySelected.append(SelectedCards(index: indexOfChosenCard!))
        
        cardsAlreadySelected = cardsAlreadySelected.removeDuplicates()
//        cardsAlreadySelected.removeDuplicates()

        
//        
        if cardsAlreadySelected.count>2{
            doCardsMatch = checkMatchingCards(Selectedcards: cardsAlreadySelected)
//            print("SetModel.DocardsMatch: ",doCardsMatch)
//            If cards don't match than do this
            if doCardsMatch == false {
                for index in cardsAlreadySelected.indices{
                    cards[cardsAlreadySelected[index].index].isPicked = false
                }
            }
        }

        cards[indexOfChosenCard!].isPicked.toggle()
        
    }
    
    mutating func acceptDealtCards(dealtCards: Array<CardSet>){
        
//        If cards are matching than remove the matching cards and deal new cards
        if doCardsMatch == true{
            removeMatchingCards()
            doCardsMatch = false
        }
        
        for index in dealtCards.indices{
            cards.append(Card(id: cardIndexForId, shape:  dealtCards[index].shape, color: dealtCards[index].color, shapeProperty: dealtCards[index].shapeProperty, numberOfShapes: dealtCards[index].numberOfShapes))
            cardIndexForId += 1
        }
        
    }
    
    init(numberOfCards: Int,createCardContent: (Int) -> CardSet ) {
//        doCardsMatch = false
        cards = Array<Card>()
        
        for index in 0..<numberOfCards{
            let content = createCardContent(index)
            
            cards.append(Card(id: cardIndexForId, shape:  content.shape, color: content.color, shapeProperty: content.shapeProperty, numberOfShapes: content.numberOfShapes))
            cardIndexForId += 1
        }
    }
    
        struct Card: Identifiable {
            var isPicked: Bool = false
            var pairMatch: Bool = false
            var id: Int
            var shape: CardShapes
            var color: Color
            var shapeProperty: ShapePropertyType
            var numberOfShapes: Int
        }
    
    struct SelectedCards: Equatable{
        var index: Int
    }


}

extension Array where Element:Equatable {
    func removeDuplicates() -> Array<Element> {
        var result = Array<Element>()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}







//
//        var indexCount = 0
//        for index in indexOfMatchingCards {
//
//
//            if indexCount == 0{
//                print("0 -Removing Card no: \(cards[index].numberOfShapes) And Card Col: \(cards[index].color ) AND property: \(cards[index].shapeProperty)")
//                cards.remove(at: index)
//
//            }
//
//            else if indexCount == 1{
//
//                var newIndex = index-1
//                if newIndex < 0 {
//                    newIndex = 0
//                }
//                print("1 - Removing Card no: \(cards[newIndex].numberOfShapes) And Card Col: \(cards[newIndex].color ) AND property: \(cards[newIndex].shapeProperty)")
//                cards.remove(at: newIndex)
//            }
//
//            else if indexCount == 2{
//                var newIndex = index-2
//
//                if newIndex < 0 {
//                    newIndex = 0
//                }
//                print("2 - Removing Card no: \(cards[newIndex].numberOfShapes) And Card Col: \(cards[newIndex].color ) AND property: \(cards[newIndex].shapeProperty)")
//                cards.remove(at: newIndex)
//            }
//            indexCount += 1
//
//        }
