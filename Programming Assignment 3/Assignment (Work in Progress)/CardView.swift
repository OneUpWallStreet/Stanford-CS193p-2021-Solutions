<<<<<<< HEAD
=======

>>>>>>> de3dd0cd15f9f9fce4c65bde610abd69ac8c2018
import SwiftUI

struct CardView: View {

    var card: SetModel.Card
    
    var body: some View {

            let RR = RoundedRectangle(cornerRadius: 10)
            ZStack{
                if card.isPicked == true && card.pairMatch == false{
                    RR.fill().foregroundColor(.pink).opacity(0.2)
                    RR.stroke(lineWidth: 7).foregroundColor(.secondary)
                    
                }
                
                else if card.isPicked == true && card.pairMatch == true{
                    RR.fill().foregroundColor(.green).opacity(0.4)
                    RR.stroke(lineWidth: 3).foregroundColor(.black)
                    
                }
                
                else{
                    RR.fill().foregroundColor(.white)
                    RR.stroke(lineWidth: 3).foregroundColor(.pink)
                }
                

                returnShape(numberOfShapes: card.numberOfShapes, shape: card.shape, shapeProperty: card.shapeProperty,color: card.color)
            }
    }
}
