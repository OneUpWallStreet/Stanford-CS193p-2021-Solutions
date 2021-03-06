
import Foundation
import SwiftUI

struct SetModel {
    
    var cards = Array<Card>()
    var cardIndexForId: Int = 0
    var doCardsMatch: Bool = false
//    var gameOver: Bool = false
    
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
//          Changing so that they are coloured in green becuase all 3 matched
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
            cards.remove(at: indexToRemove!)

        }
        
    }

    mutating func choose(card: Card){
        
//      If cards match than you remove the matching cards and select the new card
        if doCardsMatch == true {
            removeMatchingCards()
            doCardsMatch = false
        }
        
        var indexOfChosenCard: Int?
        var cardsAlreadySelected: Array<SelectedCards> = []
        
        

//       Selects the one card which is tapped on
        for index in cards.indices{
            if card.numberOfShapes == cards[index].numberOfShapes && card.color == cards[index].color && card.shape == cards[index].shape && card.shapeProperty == cards[index].shapeProperty{
                indexOfChosenCard = index
            }
        }
        
//        If the already selected card is chosen than nothing happens
        if indexOfChosenCard == nil {
            return
        }
        
//      Check how many cards are already selected
        for index in cards.indices{
            if cards[index].isPicked==true{
                cardsAlreadySelected.append(SelectedCards(index: index))
            }
        }
        cardsAlreadySelected.append(SelectedCards(index: indexOfChosenCard!))
        
        cardsAlreadySelected = cardsAlreadySelected.removeDuplicates()

        
//        
        if cardsAlreadySelected.count>2{
            doCardsMatch = checkMatchingCards(Selectedcards: cardsAlreadySelected)
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

