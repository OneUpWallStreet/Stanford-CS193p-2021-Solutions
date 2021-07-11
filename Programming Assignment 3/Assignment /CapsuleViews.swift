//
//  ElipseViews.swift
//  SoloSet
//
//  Created by Arteezy on 7/7/21.
//

import SwiftUI

@ViewBuilder
func capsuleFilled(numberOfShapes: Int,color: Color) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Capsule().aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Capsule().aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Capsule().aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
    }
    
}

@ViewBuilder
func capsuleShaded(numberOfShapes: Int,color: Color) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Capsule().opacity(0.4).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Capsule().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Capsule().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
    }
    
}

@ViewBuilder
func capsuleStroked(numberOfShapes: Int,color: Color) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Capsule().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Capsule().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Capsule().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
            Capsule().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(color)
        }.padding()
    }
    
}
