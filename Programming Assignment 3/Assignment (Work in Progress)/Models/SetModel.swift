
import Foundation

struct SetModel {
    
    var cards = Array<Card>()
    
    func choose(card: Card){
        
        print("dog")
    }
    
    init(numberOfCards: Int,createCardContent: (Int) -> CardSet ) {
        cards = Array<Card>()
        
        for index in 0..<numberOfCards{
            let content = createCardContent(index)
            
            cards.append(Card(id: index, shape:  content.shape, color: content.color, shapeProperty: content.shapeProperty, numberOfShapes: content.numberOfShapes))
        }
        

    }
    
        struct Card: Identifiable {
            var isPicked: Bool = false
            var id: Int
            var shape: CardShapes
            var color: String
            var shapeProperty: ShapePropertyType
            var numberOfShapes: Int
        }
}

