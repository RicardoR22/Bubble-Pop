//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by mitchell hudson on 9/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit
import GameplayKit


let scoreLabel = Label(fontNamed: "Chalkduster", fontSize: 20, name: "scoreLabel", text: "Score: 0")

class GameScene: SKScene {
    
    
    static func Load(scene: SKScene) -> SKScene? {
        return scene
    }
    
    
    
    override func didMove(to view: SKView) {


        if let view = self.view {
            scoreLabel.position = CGPoint(x: 50, y: view.bounds.height - 50)
        }
        
        if scoreLabel.parent == nil {
            addChild(scoreLabel)
        }
        
        let create = SKAction.run {
            self.createSquare(label: scoreLabel)
        }
        
        
        let wait = SKAction.wait(forDuration: 1)
        let sequence = SKAction.sequence([create,wait, create, wait])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
        
        
       

    }
    
  
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if scoreLabel.Score < 0 {
            if let view = self.view {
                if let scene = GameScene.Load(scene: GameOver(size: view.bounds.size)) {
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                }
            }
        }
       
    }
    

    
    func createSquare(label: Label){
        let square = Square(scene: self, label: label)
        
        if let view = self.view {
            let moveUp = SKAction.moveBy(x: 0.00, y: view.bounds.height, duration: 3.0)
            let removeSquare = SKAction.removeFromParent()
            let removePoints = SKAction.run {
                scoreLabel.Score -= 1
                scoreLabel.text = "Score: " + String(scoreLabel.Score)
            }
            
            square.position.x = CGFloat.random(in: 0..<size.width)
            square.position.y = 0
            
            let sequence = SKAction.sequence([moveUp, removeSquare, removePoints])
            square.run(sequence)
            
            
        }
        addChild(square)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            let node = atPoint(touchLocation)
            if node.name == "square" {
                node.removeFromParent()
                scoreLabel.Score += 1
                scoreLabel.text = "Score: " + String(scoreLabel.Score)
            }
            
        }

    }
    
    
    
}

