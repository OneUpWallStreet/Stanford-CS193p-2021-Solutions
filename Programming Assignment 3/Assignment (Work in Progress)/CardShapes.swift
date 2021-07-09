import SwiftUI

@ViewBuilder
func returnShape (numberOfShapes: Int,shape: CardShapes,shapeProperty: ShapePropertyType,color: Color) -> some View{
    
    switch shape {
    case .Dimond:
        switch shapeProperty {
            case ShapePropertyType.filledSymbol:
                dimondFilled(numberOfShapes: numberOfShapes)
                
            case ShapePropertyType.shadedSymbol:
                dimondShaded(numberOfShapes: numberOfShapes)
                
            case ShapePropertyType.strokedSymbol:
                dimondStroked(numberOfShapes: numberOfShapes)
        }
        
    case .Rectangle:
        switch shapeProperty {
            case ShapePropertyType.filledSymbol:
                rectFilled(numberOfShapes: numberOfShapes)

            case ShapePropertyType.shadedSymbol:
                rectShaded(numberOfShapes: numberOfShapes)

            case ShapePropertyType.strokedSymbol:
                rectStroked(numberOfShapes: numberOfShapes)

        }
        
    case .Capsule:
        switch shapeProperty {
            case ShapePropertyType.filledSymbol:
                capsuleFilled(numberOfShapes: numberOfShapes)
                
            case ShapePropertyType.shadedSymbol:
                capsuleShaded(numberOfShapes: numberOfShapes)
                
            case ShapePropertyType.strokedSymbol:
                capsuleStroked(numberOfShapes: numberOfShapes)
        }
    }
}

