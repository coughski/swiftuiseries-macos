import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject var gameConfig = GameConfig() 
    let gameScene: GameScene = {
        let scene = GameScene(size: CGSize(width: 300, height: 300))
        return scene
    }()
    let debugOptions: SpriteView.DebugOptions = [.showsFPS]
    
    var body: some View {
        NavigationView {
            SettingsView(scene: gameScene)
            SpriteView(scene: gameScene, debugOptions: debugOptions)
        }
        .environmentObject(gameConfig)
        .onAppear {
            gameScene.config = gameConfig
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
