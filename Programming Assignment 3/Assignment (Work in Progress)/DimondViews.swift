//
//  DimondViews.swift
//  SoloSet
//
//  Created by Arteezy on 7/7/21.
//

import SwiftUI


@ViewBuilder
func dimondFilled(numberOfShapes: Int) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Circle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Circle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Circle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    
}

@ViewBuilder
func dimondShaded(numberOfShapes: Int) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Circle().opacity(0.4).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Circle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Circle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().opacity(0.5).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    
}

@ViewBuilder
func dimondStroked(numberOfShapes: Int) -> some View {
    
//    GeometryReader { geometry in
    if numberOfShapes == 1{
        VStack{
            Circle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
       
        
    }
    else if numberOfShapes == 2 {
        VStack{
            Circle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    else if numberOfShapes == 3 {
        VStack{
            Circle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
            Circle().stroke(lineWidth: 2).aspectRatio(2/1,contentMode: .fit).foregroundColor(.blue)
        }.padding()
    }
    
}



