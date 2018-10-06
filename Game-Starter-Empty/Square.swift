//
//  Square.swift
//  Game-Starter-Empty
//
//  Created by Ricardo Rodriguez on 10/2/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit

class Square: SKSpriteNode{
    
    init(scene: SKScene, label: Label) {
        
        let texture = SKTexture(imageNamed: "BubbleSimple")
        let size = CGSize(width: 60, height: 60)
        super.init(texture: texture, color: .purple, size: size)
        self.name = "square"
        
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
