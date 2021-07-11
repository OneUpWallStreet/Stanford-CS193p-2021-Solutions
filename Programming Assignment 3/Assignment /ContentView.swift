
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SoloSetGame
    @State var mainmenu: Bool = true
    
    var body: some View {
        
        if mainmenu == false{
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 10).ignoresSafeArea(.all).foregroundColor(.black)
                VStack{
                    
                    if viewModel.gameOver == false{
                        displayCardsLogic()
                    }
                    else{
                        Spacer()
                        Text("Good Job! You Win :D").bold().foregroundColor(.purple).font(.largeTitle)
                        Spacer()
                    }
                    
                    gameButtons()
                    
                }.padding()
                
            }

        }
        else{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(.purple).ignoresSafeArea()
                
                VStack{
                    Spacer()
                    Text("🇺🇸 Card Set 🇺🇸").font(.largeTitle).padding().foregroundColor(.white)
                    Button{
                        mainmenu = false
                    }label: {
                        VStack{
                            Image(systemName: "play.fill").foregroundColor(.white).font(.largeTitle).padding()
                            Text("Play").font(.caption).foregroundColor(.white)
                        }.padding()
                    }
                    
                    Spacer()
                }
                
            }
            
        }

    }
    
    
    @ViewBuilder
    func gameButtons() -> some View{
        
        HStack{
            if viewModel.deckCount < 81{
                DealThreeMoreCards()
            }
            else{
                Text("No More Cards Left").foregroundColor(.red).padding()
            }
            Spacer()
            NewGame()
        }
        
    }
    
    @ViewBuilder
    func displayCardsLogic() -> some View{
        
        if viewModel.cards.count < 35 {
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
        
    }
    
    @ViewBuilder
    func DealThreeMoreCards() -> some View{
        Button{
            viewModel.dealThreeMoreCards()
            
        }label: {
            Text("Deal 3 More Cards").padding()
        }
    }
    
    @ViewBuilder
    func NewGame() -> some View{
        
        Button{
            viewModel.resetGame()
//            print("New Game")
            
        }label: {
            
            Text("New Game").padding()
            
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

