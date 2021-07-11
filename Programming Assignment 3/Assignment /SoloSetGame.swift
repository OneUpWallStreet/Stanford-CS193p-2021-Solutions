import Foundation


class SoloSetGame: ObservableObject {
    
    static var deckBlueprint = Deck()
    @Published var deckCount: Int = 12
    @Published var gameOver: Bool = false

    
    @Published var model: SetModel = SetModel(numberOfCards: SoloSetGame.deckBlueprint.deck.count){ index in
        deckBlueprint.deck[index]
    }
    
    var cards: Array<SetModel.Card>{
        return model.cards
    }
    
    func resetGame(){
        
        SoloSetGame.deckBlueprint = Deck()
        deckCount = 12
        model = SetModel(numberOfCards: SoloSetGame.deckBlueprint.deck.count){ index in
            SoloSetGame.deckBlueprint.deck[index]
        }
        gameOver = false

        
    }
    
    func choose(card: SetModel.Card){
        model.choose(card: card)
        
        
        if  SoloSetGame.deckBlueprint.wholeDeck.count == 0 && deckCount == 81 && model.cards.count == 3 {
            print("Game Over Here")
            gameOver = true
            return
        }
        
        if model.cards.count  == 3 {
            for _ in 0..<3{
                dealThreeMoreCards()

            }
        }
        
        
        
    }
    
    func dealThreeMoreCards(){
        
        if deckCount >= 81 {
            return
        }
        deckCount += 3
        print(deckCount)
        
        let dealtCards = SoloSetGame.deckBlueprint.getThreeMoreCards()
        model.acceptDealtCards(dealtCards: dealtCards)
        
//        deckCount = model.totalCardsInDeck
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
