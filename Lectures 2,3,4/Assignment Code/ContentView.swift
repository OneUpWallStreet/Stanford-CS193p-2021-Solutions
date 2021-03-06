import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
//            Text("Hello \(vi)").font(.largeTitle)
            
            Text(viewModel.nameOfTheme).font(.largeTitle).foregroundColor(.yellow).bold()
            Spacer()
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card, colorTheme: viewModel.nameOfColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card: card)
                                
                                print("tapped card: ",card)

                        }
                    }
                        
                }.padding(.horizontal).foregroundColor(.pink)


                }
            
            Spacer()
            
            Text("Score:  \(viewModel.model.score)").font(.largeTitle).foregroundColor(.pink)
            
            Spacer()
            
            Button{
                viewModel.newGame()
                
            }label: {
                VStack{
                    Image(systemName: "cloud.sleet.fill").font(.largeTitle)
                    Text("New Game").font(.footnote)
                }
                
            }
            
        }

    }
    
}


struct CardView: View{
    
    let card: MemoryGame<String>.Card
    let colorTheme: String
    
    var body: some View{
        
            ZStack(content: {
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content)
//                    Text(content).font(.largeTitle)
                }
                else if card.isMatched{
                    shape.opacity(0)
                }
                else{
                    shape.fill()
                }
            })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        
//        ContentView()
//            .preferredColorScheme(.light)
    }
}
