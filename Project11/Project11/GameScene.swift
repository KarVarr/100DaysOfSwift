//
//  GameScene.swift
//  Project11
//
//  Created by Karen Vardanian on 01.01.2023.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        
        let box = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        box.position = location
        addChild(box)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self )
        
        let box = SKSpriteNode(color: .blue, size: CGSize(width: 32, height: 32))
        box.position = location
        addChild(box)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        
        let box = SKSpriteNode(color: .magenta, size: CGSize(width: 24, height: 24))
        box.position = location
        addChild(box)
    }
   
    
}
