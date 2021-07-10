import Foundation
import SwiftUI


struct Deck {
    
        var shapes = [CardShapes.Rectangle,CardShapes.Capsule,CardShapes.Dimond]
        var shapeProperties = [ShapePropertyType.filledSymbol,ShapePropertyType.shadedSymbol,ShapePropertyType.strokedSymbol]
        var numberOfShapes = [1,2,3]
    
    var deck: Array<CardSet>
    var wholeDeck: Array<CardSet>
    
    var deck_counter: Int = 0
    init() {
        deck = Array<CardSet>()
        wholeDeck = Array<CardSet>()
        
        
//        Making the deck of randomly aranged 81 cards
        let colors: [Color] = [.purple, .yellow,.orange]
        for shapeIndex in shapes.indices{
            for shapePropertiesIndex in shapeProperties.indices{
                for numberOfShapesIndex in numberOfShapes.indices{
                    for colorIndex in colors.indices{
                        wholeDeck.append(CardSet(shape: shapes[shapeIndex], color: colors[colorIndex], shapeProperty: shapeProperties[shapePropertiesIndex], numberOfShapes: numberOfShapes[numberOfShapesIndex]))
                    }
                }
            }
        }
        
//        wholeDeck.shuffle()
        print("Deck Count is: \(wholeDeck.count)")
        
        
//        Appending random 12 cards to the deck
        for index in 0..<12{
            deck.append(wholeDeck[index])
            wholeDeck.remove(at: index)
            deck_counter += 1
            
        }
    }
    
    mutating func getThreeMoreCards() -> Array<CardSet> {

        var returnCards: Array<CardSet> = []
        
        for index in 0..<3{
            returnCards.append(wholeDeck[index])
            wholeDeck.remove(at: index)
        }
        
        return returnCards
    }
    
    

}
