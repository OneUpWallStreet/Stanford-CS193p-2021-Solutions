//
//  Deck.swift
//  SoloSet
//
//  Created by Arteezy on 7/9/21.
//

import Foundation
import SwiftUI


class Deck {
    
    //    CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2)
        var shapes = [CardShapes.Rectangle,CardShapes.Capsule,CardShapes.Dimond]
        var shapeProperties = [ShapePropertyType.filledSymbol,ShapePropertyType.shadedSymbol,ShapePropertyType.strokedSymbol]
    //    private var colors: [Color] = [.yellow, .purple, .green]
        var numberOfShapes = [1,2,3]
    
    var deck: Array<CardSet>
    init() {
        deck = Array<CardSet>()
        let colors: [Color] = [.orange, .yellow, .purple]
//        var dog: Color
        for shapeIndex in shapes.indices{
            for shapePropertiesIndex in shapeProperties.indices{
                for numberOfShapesIndex in numberOfShapes.indices{
                    for colorIndex in colors.indices{
                        deck.append(CardSet(shape: shapes[shapeIndex], color: colors[colorIndex], shapeProperty: shapeProperties[shapePropertiesIndex], numberOfShapes: numberOfShapes[numberOfShapesIndex]))
                    }
                }
            }
        }
//        deck.append(CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2))
//        deck.append(CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 1))
//        deck.append(CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3))

        deck.shuffle()
        
    }
    
    
    
}
