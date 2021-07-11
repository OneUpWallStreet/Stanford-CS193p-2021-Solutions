import SwiftUI

struct CardView: View {

    var card: SetModel.Card
    
    var body: some View {

            let RR = RoundedRectangle(cornerRadius: 10)
            ZStack{
                if card.isPicked == true && card.pairMatch == false{
                    RR.fill().foregroundColor(.pink).opacity(0.1)
                    RR.stroke(lineWidth: 5).foregroundColor(.blue)
                    
                }
                
                else if card.isPicked == true && card.pairMatch == true{
                    RR.fill().foregroundColor(.pink).opacity(0.4)
                    RR.stroke(lineWidth: 3).foregroundColor(.white)
                    
                }
                
                else{
                    RR.fill().foregroundColor(.white)
                    RR.stroke(lineWidth: 3).foregroundColor(.pink)
                }
                

                returnShape(numberOfShapes: card.numberOfShapes, shape: card.shape, shapeProperty: card.shapeProperty,color: card.color)
            }
    }
}
