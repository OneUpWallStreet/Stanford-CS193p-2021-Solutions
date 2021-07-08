//func returnShape (numberOfShapes: Int,shape: CardShapes,shapeProperty: ShapePropertyType) -> some View{

import SwiftUI

struct CardView: View {
    
    var numberOfShapes: Int
    var shape: CardShapes
    var shapeProperty: ShapePropertyType
    
    var body: some View {
        
//        GeometryReader{ geometry in
        
            ZStack{
                let RR = RoundedRectangle(cornerRadius: 10)
                RR.fill().foregroundColor(.white)
                RR.stroke(lineWidth: 3)
//                VStack{
////                    Spacer()
//                    Rectangle().foregroundColor(.black).padding().aspectRatio(2/1,contentMode: .fit)
////                    Spacer()
//                    Rectangle().foregroundColor(.black).padding().aspectRatio(2/1,contentMode: .fit)
//                    Rectangle().foregroundColor(.black).padding().aspectRatio(2/1,contentMode: .fit)
//                }

                
                returnShape(numberOfShapes: numberOfShapes, shape: shape, shapeProperty: shapeProperty)
            }
            
//        }
    }
    private func font(in size: CGSize ) -> Font{
        Font.system(size: min(size.width,size.height)*DrawingConstants.fontScale)
        
    }
    
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(content: )
//    }
//}
