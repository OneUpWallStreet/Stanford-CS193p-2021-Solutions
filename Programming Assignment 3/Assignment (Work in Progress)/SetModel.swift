
import Foundation
import SwiftUI

struct SetModel {
    
    var cards = Array<Card>()
    
    
    func checkMatchingCards(Selectedcards: Array<SelectedCards>) -> Bool{
        
        let indexCard1: Int = Selectedcards[0].index
        let indexCard2: Int = Selectedcards[1].index
        let indexCard3: Int = Selectedcards[2].index
        
        if
//            (cards[indexCard1].color == cards[indexCard2].color && cards[indexCard3].color == cards[indexCard1].color && cards[indexCard2].color == cards[indexCard3].color)
//            ||
            (cards[indexCard1].numberOfShapes == cards[indexCard2].numberOfShapes && cards[indexCard3].numberOfShapes == cards[indexCard1].numberOfShapes && cards[indexCard2].numberOfShapes == cards[indexCard3].numberOfShapes)
            ||
            (cards[indexCard1].shapeProperty == cards[indexCard2].shapeProperty && cards[indexCard3].shapeProperty == cards[indexCard1].shapeProperty && cards[indexCard2].shapeProperty == cards[indexCard3].shapeProperty)
            ||
            (cards[indexCard1].shape == cards[indexCard2].shape && cards[indexCard3].shape == cards[indexCard1].shape && cards[indexCard2].shape == cards[indexCard3].shape)
        {
//            print()
            return true
        }
        else{
            return false
        }
        
        
    }
    
    
    mutating func choose(card: Card){
        
        var indexOfChosenCard: Int?
        var cardsAlreadySelected: Array<SelectedCards> = []
        var doCardsMatch: Bool
        
//       Selects the one card which is tapped on
        for index in cards.indices{
            if card.id == cards[index].id{
                indexOfChosenCard = index
            }
        }
        
//      Check how many cards are already selected
        for index in cards.indices{
            if cards[index].isPicked==true{
                cardsAlreadySelected.append(SelectedCards(index: index))
            }
        }
        
        
        
        cardsAlreadySelected.append(SelectedCards(index: indexOfChosenCard!))
//        print(cardsAlreadySelected.count)
        
        if cardsAlreadySelected.count>2{
            doCardsMatch = checkMatchingCards(Selectedcards: cardsAlreadySelected)
            print(doCardsMatch)
            
            if doCardsMatch == false {
                print("HEre")
                for index in cardsAlreadySelected.indices{
                    cards[cardsAlreadySelected[index].index].isPicked = false
                }
            }
        }

        print(cards[indexOfChosenCard!].isPicked)
        cards[indexOfChosenCard!].isPicked.toggle()
        
    }
    
    init(numberOfCards: Int,createCardContent: (Int) -> CardSet ) {
        cards = Array<Card>()
//        SoloSetGame.deck.shuffle()
        
        for index in 0..<numberOfCards{
            let content = createCardContent(index)
            
            cards.append(Card(id: index, shape:  content.shape, color: content.color, shapeProperty: content.shapeProperty, numberOfShapes: content.numberOfShapes))
        }
        

    }
    
        struct Card: Identifiable {
            var isPicked: Bool = false
            var id: Int
            var shape: CardShapes
            var color: Color
            var shapeProperty: ShapePropertyType
            var numberOfShapes: Int
        }
    
    struct SelectedCards{
//        var id: Int
        var index: Int
    }



}

extension Array {
    var howManyElementsFound: Element? {
        return nil
    }
}




