import SwiftUI

//strokedSymbol, filledSymbol and shadedSymbol


@ViewBuilder
func returnShape (numberOfShapes: Int,shape: CardShapes,shapeProperty: ShapePropertyType) -> some View{
    
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


//@ViewBuilder
//func returnSoloRect() -> some View {
//    Rect().stroke(lineWidth: 3).foregroundColor(.blue).padding()
//}
//
//
//@ViewBuilder
//func returnDoubleRect() -> some View {
//    VStack{
//        Rect().stroke(lineWidth: 3).foregroundColor(.blue)
//        Rect().stroke(lineWidth: 3).foregroundColor(.blue)
//    }.padding()
//
//}
//
//@ViewBuilder
//func returnTripleRect() -> some View {
//    VStack{
//        Rect().stroke(lineWidth: 3).foregroundColor(.blue)
//        Rect().stroke(lineWidth: 3).foregroundColor(.blue)
//        Rect().stroke(lineWidth: 3).foregroundColor(.blue)
//    }.padding()
//
//}

//VStack{
//    ForEach(0..<numberOfShapes){ _ in
////                        Rect().foregroundColor(.blue).padding()
//        Spacer(minLength: 0)
//        rectStroked(numberOfShapes: 2).padding()
//        Spacer(minLength: 0)
////                        Rect().padding()
//    }
//}


//                VStack{
////                    Rect_three()
//                    ForEach(0..<numberOfShapes){ _ in
////                        Rect().foregroundColor(.blue).padding()
//                        Spacer(minLength: 0)
//                        Rect_two().padding()
//                        Spacer(minLength: 0)
////                        Rect().padding()
//                    }
//                }


//struct Rect: Shape {
//
//
//    func path(in rect: CGRect) -> Path {
//
//
//        var p = Path()
//        p.addRect(rect)
////        p.size(s)
//        return p
//    }
//}
