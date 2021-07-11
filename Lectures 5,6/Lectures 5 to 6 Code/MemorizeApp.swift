
import SwiftUI

@main
struct MemorizeApp: App {
//    Free init that classes get
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
