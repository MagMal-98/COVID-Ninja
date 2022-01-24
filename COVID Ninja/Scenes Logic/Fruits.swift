//
//  Fruits.swift
//  COVID Ninja
//
//  Created by Magda Malczewska on 15/01/2022.
//

import Foundation
import SpriteKit

class Fruit: SKNode {
    
    override init() {
        super.init()
        
        let vaccine = "💉"
        let virus = "🦠"
        let mask = "😷"
        let soap = "🧼"
        let thermometer = "🌡"
        let stethoscope = "🩺"
        
        let label = SKLabelNode()
        var fruit = ""
        
        switch arc4random_uniform(6){
        case 1:
            fruit = vaccine
            name = "yes"
            
        case 2:
            fruit = mask
            name = "yes"
            
        case 3:
            fruit = soap
            name = "yes"
            
        case 4:
            fruit = thermometer
            name = "yes"
            
        case 5:
            fruit = stethoscope
            name = "yes"
            
        default:
            fruit = virus
            name = "no"
            
        }
        
        label.text = fruit
        label.fontSize = 100
        label.verticalAlignmentMode = .center
        addChild(label)
        
        physicsBody = SKPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
