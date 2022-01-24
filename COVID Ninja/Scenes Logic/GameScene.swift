//
//  GameScene.swift
//  COVID Ninja
//
//  Created by Magda Malczewska on 15/01/2022.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene{
    
    var scoreLabel = SKLabelNode()
    
    var score = 0
    
    var timer = Timer()
    
    override func didMove(to view: SKView) {
        view.scene?.size = CGSize(width: 1334, height: 750)
        view.scene?.scaleMode = .aspectFill
        anchorPoint = .zero
        physicsWorld.gravity = CGVector(dx: 0, dy: -2)
        
        timer = .scheduledTimer(timeInterval: 2, target: self, selector: #selector(createFruit), userInfo: nil, repeats: true)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            _ = atPoint(location)
            let previousLocation = touch.previousLocation(in: self)
            
            for node in nodes(at: location){
                if node.name == "yes" {
                    
                    let emitter = SKEmitterNode(fileNamed: "fruitExplosion")
                    emitter?.position = node.position
                    emitter?.zPosition = 5
                    addChild(emitter!)
                    
                    addScore()
                    node.removeFromParent()
                }
                
                if node.name == "no" {
                    node.removeFromParent()
                    gameOver()
                }
            }
            
            let path = CGMutablePath()
            path.move(to: location)
            path.addLine(to: previousLocation)
            
            let line = SKShapeNode(path: path)
            line.lineWidth = 8
            line.strokeColor = .black
            addChild(line)
            
            let fadeout = SKAction.fadeOut(withDuration: 0.3)
            let remove = SKAction.removeFromParent()
            let sequence = SKAction.sequence([fadeout, remove])
            line.run(sequence)
        }
    }
    
    @objc func createFruit(){
        
        let randomNumber = Int(GKRandomDistribution(lowestValue: 3, highestValue: 6).nextInt())
        
        for _ in 0..<randomNumber {
            let fruit = Fruit()
            fruit.position = CGPoint(x: GKRandomDistribution(lowestValue: 20, highestValue: Int(size.width)).nextInt(), y: -50)
            fruit.zPosition = 10
            addChild(fruit)
            
            if fruit.position.x < size.width / 2 {
                fruit.physicsBody?.velocity.dx = CGFloat(arc4random_uniform(300))
            }
            
            if fruit.position.x > size.width / 2 {
                fruit.physicsBody?.velocity.dx = CGFloat(-200)
            }
            
            fruit.physicsBody?.velocity.dy = CGFloat(GKRandomDistribution(lowestValue: 500, highestValue: 700).nextInt())
            fruit.physicsBody?.angularVelocity = CGFloat(GKRandomDistribution(lowestValue: -5, highestValue: 5).nextInt())
        }
        
    }
    
    func gameOver() {
        let gameOverScene = GameOverScene(fileNamed: "gameOverScene")!
        
        view?.presentScene(gameOverScene)
    }
    
    func addScore(){
        scoreLabel = childNode(withName: "scoreLabel") as! SKLabelNode
        
        score += 1
        
        scoreLabel.text = "Score: \(score)"
    }
    
}
