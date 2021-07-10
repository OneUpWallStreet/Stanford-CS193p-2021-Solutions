
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SoloSetGame
    
    var body: some View {
        VStack{
//            Text("One Set").bold().padding().foregroundColor(.blue).font(.title)
            
            if viewModel.cards.count < 50 {
                AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                    ShowCardsView(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                }
            }
            else {
                ScrollView{
  
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))],spacing: 0, content: {
                        ForEach(viewModel.cards){ card in
                            ShowCardsView(card: card).aspectRatio(2/3,contentMode: .fit).onTapGesture {
                                viewModel.choose(card: card)
                            }
                        }
                    })

                }
            }
            DealThreeMoreCards()
        }
    }
    
    @ViewBuilder
    func DealThreeMoreCards() -> some View{
        Button{
            viewModel.dealThreeMoreCards()
            
        }label: {
            Text("Deal 3 More Cards")
        }
    }
    
    @ViewBuilder
    func ShowCardsView(card: SetModel.Card) -> some View {
        CardView(card: card).padding(4)
    }
}
























struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = SoloSetGame()
        ContentView(viewModel: game).preferredColorScheme(.dark)
    }
}

