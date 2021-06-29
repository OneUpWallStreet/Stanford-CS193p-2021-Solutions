//
//  ContentView.swift
//  Memorize
//
//  Created by OneUpWallStreet on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    

    
    @State var vehicles = ["✈️","🚗","🚔","🚚","🚜","🛳","🚝","🛻"]
    @State var animals = ["🐳","🐋","🐊","🐍","🐢","🦛","🦕","🦖"]
    @State var faces = ["🤣","😭","😜","😎","🥳","😡","🙄","😁"]
    
    @State var V_Visible: Bool = true
    @State var A_Visible: Bool = false
    @State var F_Visible: Bool = false
    
    @State var selectedTheme: String = "faces"
    
    @State var emojiCount = 8
    
    
    
    
    var body: some View {
        
        VStack(content: {
            
                    
            ScrollView{
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    
                    if selectedTheme == "vehicles"{
                        ForEach(vehicles[0..<emojiCount], id: \.self){ emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                        
                    }
                    
                    if selectedTheme == "animals"{
                        
                        ForEach(animals[0..<emojiCount], id: \.self){ emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                        
                    }
                    
                    if selectedTheme == "faces"{
                        
                        ForEach(faces[0..<emojiCount], id: \.self){ emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                        
                    }
                    
                
                    

                }
                
            }
            
            HStack{
                
                Spacer()
                
                
                Button{
                    
                    if (V_Visible==false){
                        vehicles.shuffle()
                    }
                    
                    V_Visible = true
                    selectedTheme = "vehicles"
                    
                    
                    A_Visible = false
                    F_Visible = false
                    
                }label: {
                    if (V_Visible==true){
                        VStack{
                            Image(systemName: "car").font(.title)
                            Text("Vehicle").font(.footnote)
                        }
                    }
                    else{
                        VStack{
                            Image(systemName: "questionmark.circle").font(.title)
                            Text("Theme 1").font(.footnote)
                        }
                    }
                }
                
                Spacer()
                
                
                Button{
                    
                    if (A_Visible==false){
                        animals.shuffle()
                    }
                    
                    A_Visible = true
                    selectedTheme = "animals"
                    
                    V_Visible = false
                    F_Visible = false
                    
                    
                }label: {
                    if (A_Visible==true){
                        VStack{
                            Image(systemName: "hare").font(.title)
                            Text("Animal").font(.footnote)
                        }
                    }
                    else{
                        VStack{
                            Image(systemName: "questionmark.circle").font(.title)
                            Text("Theme 2").font(.footnote)
                        }
                    }
                }
                
                
                Spacer()
                
                
                
                Button{
                    
                    
                    if(F_Visible==false){
                        faces.shuffle()
                    }
                    
                    F_Visible = true
                    selectedTheme = "faces"
                    
                    
                    A_Visible = false
                    V_Visible = false
                    
                }label: {
                    if (F_Visible==true){
                        VStack{
                            Image(systemName: "face.smiling").font(.title)
                            Text("Faces").font(.footnote)
                        }
                    }
                    else{
                        VStack{
                            Image(systemName: "questionmark.circle").font(.title)
                            Text("Theme 3").font(.footnote)
                        }
                    }
                }
                
                Spacer()
                
            
            
            }.foregroundColor(.blue)
            
            
            
            
            
        }).padding(.horizontal).foregroundColor(.red)
    }
    
    var remove: some View{
        
        Button{
            if emojiCount>1{
                emojiCount -= 1
            }
            
        }label: {
            VStack{
                Image(systemName: "minus.circle").font(.largeTitle).foregroundColor(.blue)
            }
        }
        
    }
    
    var add: some  View{
        
        Button(action: {
            if emojiCount<vehicles.count{
                emojiCount += 1
            }
            
        }, label: {
            VStack{
                Image(systemName: "plus.circle").font(.largeTitle).foregroundColor(.blue)
            }
        })
        
        
    }
}



struct CardView: View{
    
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View{
        
            ZStack(content: {
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                }
                else{
                    shape.fill()
                }
            }).onTapGesture{
                isFaceUp = !isFaceUp
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
//        ContentView()
//            .preferredColorScheme(.light)
    }
}
