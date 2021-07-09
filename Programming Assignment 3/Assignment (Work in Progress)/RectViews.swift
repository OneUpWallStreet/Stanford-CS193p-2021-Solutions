//
//  RectViews.swift
//  SoloSet
//
//  Created by Arteezy on 7/7/21.
//

import SwiftUI

@ViewBuilder
func rectFilled(numberOfShapes: Int) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Rectangle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Rectangle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Rectangle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    
}

@ViewBuilder
func rectShaded(numberOfShapes: Int) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Rectangle().opacity(0.4).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Rectangle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Rectangle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    
}

@ViewBuilder
func rectStroked(numberOfShapes: Int) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Rectangle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Rectangle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Rectangle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Rectangle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    
}
