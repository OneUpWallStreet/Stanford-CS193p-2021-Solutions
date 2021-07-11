import SwiftUI

@ViewBuilder
func returnShape (numberOfShapes: Int,shape: CardShapes,shapeProperty: ShapePropertyType,color: Color) -> some View{
    
    switch shape {
    case .Dimond:
        switch shapeProperty {
            case ShapePropertyType.filledSymbol:
                dimondFilled(numberOfShapes: numberOfShapes,color: color)
                
            case ShapePropertyType.shadedSymbol:
                dimondShaded(numberOfShapes: numberOfShapes,color: color)
                
            case ShapePropertyType.strokedSymbol:
                dimondStroked(numberOfShapes: numberOfShapes,color: color)
        }
        
    case .Rectangle:
        switch shapeProperty {
            case ShapePropertyType.filledSymbol:
                rectFilled(numberOfShapes: numberOfShapes,color: color)

            case ShapePropertyType.shadedSymbol:
                rectShaded(numberOfShapes: numberOfShapes,color: color)

            case ShapePropertyType.strokedSymbol:
                rectStroked(numberOfShapes: numberOfShapes,color: color)

        }
        
    case .Capsule:
        switch shapeProperty {
            case ShapePropertyType.filledSymbol:
                capsuleFilled(numberOfShapes: numberOfShapes,color: color)
                
            case ShapePropertyType.shadedSymbol:
                capsuleShaded(numberOfShapes: numberOfShapes,color: color)
                
            case ShapePropertyType.strokedSymbol:
                capsuleStroked(numberOfShapes: numberOfShapes,color: color)
        }
    }
}

