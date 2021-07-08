//
//  SoloSetApp.swift
//  SoloSet
//
//  Created by Arteezy on 7/5/21.
//

import SwiftUI

@main
struct SoloSetApp: App {
    let game = SoloSetGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
