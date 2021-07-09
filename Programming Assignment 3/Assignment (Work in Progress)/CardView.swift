//func returnShape (numberOfShapes: Int,shape: CardShapes,shapeProperty: ShapePropertyType) -> some View{

import SwiftUI

struct CardView: View {

    var card: SetModel.Card
    
    var body: some View {

            ZStack{
                if card.isPicked == true{
                    let RR = RoundedRectangle(cornerRadius: 10)
                    RR.fill().foregroundColor(.white)
                    RR.stroke(lineWidth: 3).foregroundColor(.green)
                }
                else{
                    let RR = RoundedRectangle(cornerRadius: 10)
                    RR.fill().foregroundColor(.white)
                    RR.stroke(lineWidth: 3).foregroundColor(.pink)
                }
                

                returnShape(numberOfShapes: card.numberOfShapes, shape: card.shape, shapeProperty: card.shapeProperty,color: card.color)
            }
    }
}
