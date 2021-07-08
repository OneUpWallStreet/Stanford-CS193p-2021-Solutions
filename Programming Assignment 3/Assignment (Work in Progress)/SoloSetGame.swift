//
//  SoloSetGame.swift
//  SoloSet
//
//  Created by Arteezy on 7/5/21.
//

import Foundation


class SoloSetGame {
    
//    static var deck: Array<CardSet> =  [CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 1)]
    static var deck: Array<CardSet> = [CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2)]
    

  
    private var model: SetModel = SetModel(numberOfCards: deck.count){ index in
        deck[index]
//        CardSet(shape: CardShapes.Rectangle, color: "red", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2)
//
    }
    
    var cards: Array<SetModel.Card>{
        return model.cards
    }
    
    func choose(card: SetModel.Card){
        model.choose(card: card)
        
    }

}







//    private var model: SetModel<SoloSetTheme> = SetModel<SoloSetTheme>{ _ in
//        return SoloSetTheme.Rect(color: "red", properties: "filled",numberOfShapes: 2)
//        }



//    enum SoloSetTheme {
//        case Rect(color: String,properties: String,numberOfShapes: Int)
//        case Dimond(color: String,properties: String, numberOfShapes: Int)
//        case Elipse(color: String,properties: String, numberOfShapes: Int)
//    }
