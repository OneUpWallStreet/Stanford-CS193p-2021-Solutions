
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SoloSetGame
    
    var body: some View {
        VStack{
            Text("One Set").bold().padding().foregroundColor(.blue).font(.title)
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                ShowCardsView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
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

