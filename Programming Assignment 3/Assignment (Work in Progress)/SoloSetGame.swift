import Foundation


class SoloSetGame: ObservableObject {
    
    static var deckk = Deck()

    
//    CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2)
    var shapes = [CardShapes.Rectangle,CardShapes.Capsule,CardShapes.Dimond]
    var shapeProperties = [ShapePropertyType.filledSymbol,ShapePropertyType.shadedSymbol,ShapePropertyType.strokedSymbol]
//    private var colors: [Color] = [.yellow, .purple, .green]
    var numberOfShapes = [1,2,3]
    
  
    @Published private var model: SetModel = SetModel(numberOfCards: SoloSetGame.deckk.deck.count){ index in
        deckk.deck[index]
        
    }
    
    var cards: Array<SetModel.Card>{
        return model.cards
    }
    
    func choose(card: SetModel.Card){
        model.choose(card: card)
        
    }

}































//    static var deck: Array<CardSet> = [CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2)]
