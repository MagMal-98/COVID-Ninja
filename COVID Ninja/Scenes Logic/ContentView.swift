//
//  ContentView.swift
//  COVID Ninja
//
//  Created by Magda Malczewska on 15/01/2022.
//

import SwiftUI
import SpriteKit

class StartScene: SKScene{
    
    var startLabel = SKLabelNode()
    
    let fadeOut = SKAction.fadeOut(withDuration: 0.4)
    let fadeIn = SKAction.fadeIn(withDuration: 0.4)
    
    override func didMove(to view: SKView) {
        view.scene?.size = CGSize(width: 1334, height: 750)
        view.scene?.scaleMode = .aspectFill
        
        startLabel = childNode(withName: "startLabel") as! SKLabelNode
        
        let sequence = SKAction.sequence([fadeOut, fadeIn])
        startLabel.run(SKAction.repeatForever(sequence))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            let startNode = atPoint(location)
            let gameScene = GameScene(fileNamed: "gameScene")
            
            if startNode.name == "startLabel"{
                view?.presentScene(gameScene)
            }
        }
    }
}

struct ContentView: View {
    let startScene = StartScene(fileNamed: "mainMenuScene")!
    
    var body: some View {
        SpriteView(scene: startScene)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeRight)
    }
}
