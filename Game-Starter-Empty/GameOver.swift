//
//  GameOver.swift
//  Game-Starter-Empty
//
//  Created by Ricardo Rodriguez on 10/4/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit

class GameOver: SKScene {
    
    let gameOver = Label(fontNamed: "Chalkduster", fontSize: 30, name: "GameOverLabel", text: "GAME OVER")
    let replay = Label(fontNamed: "Chalkduster", fontSize: 30, name: "Replay", text: "Replay")
    let replayBackground = SKSpriteNode(texture: nil, color: .purple, size: CGSize(width: 100, height: 50))

    
    
    override func didMove(to view: SKView) {
        
        if let view = self.view {
            gameOver.position = CGPoint(x: view.bounds.width/2, y: (view.bounds.height/2) + 20)
            replay.position = CGPoint(x: view.bounds.width/2, y: (view.bounds.height/2) - 50)
            replay.addChild(replayBackground)
            replayBackground.position = CGPoint(x: 0, y: 10 )
            replayBackground.name = "ReplayBackground"
            replay.zPosition = 2
            
        }
        addChild(gameOver)
        addChild(replay)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            let node = atPoint(touchLocation)
            if node.name == "Replay" {
                if let view = view {
                    if let scene = GameScene.Load(scene: GameScene(size: view.bounds.size)) {
                        scene.scaleMode = .aspectFill
                        view.presentScene(scene)
                    }
                }
            }

        }

    }
}
