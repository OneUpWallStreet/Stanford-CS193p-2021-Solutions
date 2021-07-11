
import Foundation
import SwiftUI

struct CardSet: Equatable{
    var shape: CardShapes
    var color: Color
    var shapeProperty: ShapePropertyType
    var numberOfShapes: Int
}

enum CardShapes {
    case Rectangle
    case Dimond
    case Capsule
}

//strokedSymbol, filledSymbol and shadedSymbol

enum ShapePropertyType {
    case strokedSymbol
    case filledSymbol
    case shadedSymbol
}



