//
//  Label.swift
//  Game-Starter-Empty
//
//  Created by Ricardo Rodriguez on 10/2/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit


class Label: SKLabelNode {
    var Score = 0
    
    override init(fontNamed: String?) {
        
        super.init()
        
//        self.fontSize = 20
//        self.fontColor = .white
//        self.name = "ScoreLabel"
//        self.text = "Score: 0"
        
    }
    
    convenience init(fontNamed: String?, fontSize: CGFloat, name: String, text: String ) {
        self.init(fontNamed: fontNamed)
        self.fontSize = fontSize
        self.name = name
        self.text = text
        
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
