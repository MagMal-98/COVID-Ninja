//
//  GameOverScene.swift
//  COVID Ninja
//
//  Created by Magda Malczewska on 15/01/2022.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    var menuLabel = SKLabelNode()
    
    let fadeOut = SKAction.fadeOut(withDuration: 0.4)
    let fadeIn = SKAction.fadeIn(withDuration: 0.4)
    
    override func didMove(to view: SKView) {
        view.scene?.size = CGSize(width: 1334, height: 750)
        view.scene?.scaleMode = .aspectFill
        
        menuLabel = childNode(withName: "menuLabel") as! SKLabelNode
        
        let sequence = SKAction.sequence([fadeOut, fadeIn])
        menuLabel.run(SKAction.repeatForever(sequence))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            let startNode = atPoint(location)
            let menu = StartScene(fileNamed: "mainMenuScene")

            if startNode.name == "menuLabel"{
                view?.presentScene(menu)
            }
        }
    }
}
