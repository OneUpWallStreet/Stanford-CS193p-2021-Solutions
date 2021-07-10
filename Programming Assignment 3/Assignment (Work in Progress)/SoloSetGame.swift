import Foundation


class SoloSetGame: ObservableObject {
    
    static var deckBlueprint = Deck()

    
    @Published var model: SetModel = SetModel(numberOfCards: SoloSetGame.deckBlueprint.deck.count){ index in
        deckBlueprint.deck[index]
    }
    
    var cards: Array<SetModel.Card>{
        return model.cards
    }
    
    func choose(card: SetModel.Card){
        model.choose(card: card)
        
    }
    
    func dealThreeMoreCards(){
        
        let dealtCards = SoloSetGame.deckBlueprint.getThreeMoreCards()
        model.acceptDealtCards(dealtCards: dealtCards)
    }

}






















//    var deck: Array<CardSet>
//    var deckCounter: Int = 0
//
//    init() {
//        deck = Array<CardSet>()
//
//        for index in 0..<12{
//            deck.append(SoloSetGame.deckBlueprint.wholeDeck[index])
//            deckCounter += 1
//        }
//
//        print(SoloSetGame.deckBlueprint.wholeDeck)
//
//    }










//    static var deck: Array<CardSet> = [CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Rectangle, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.strokedSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.shadedSymbol, numberOfShapes: 3),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 1),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Capsule, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2),CardSet(shape: CardShapes.Dimond, color: "blue", shapeProperty: ShapePropertyType.filledSymbol, numberOfShapes: 2)]
