//
//  ContentView.swift
//  SoloSet
//
//  Created by Arteezy on 7/5/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel: SoloSetGame
    
    var body: some View {
        VStack{
            Text("One Set").bold().padding().foregroundColor(.blue).font(.title)
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                ShowCardsView(card: card)
            }
        }
    }
    
    @ViewBuilder
    func ShowCardsView(card: SetModel.Card) -> some View {
        CardView(numberOfShapes: card.numberOfShapes, shape: card.shape, shapeProperty: card.shapeProperty).padding(4)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = SoloSetGame()
        ContentView(viewModel: game).preferredColorScheme(.dark)
    }
}


    //            ScrollView{
    //                LazyVGrid(columns: [GridItem(.adaptive(minimum: 105))], content: {
    //
    //                    ForEach(viewModel.cards){ card in
    //
    //                        ShowCardsView(card: card)
    //                    }
    //
    //                }).padding()
    //
    //            }
//            }
