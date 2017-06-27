//
//  GameScene.swift
//  HelpNagoyaSpeciality
//
//  Created by Shogo Funaguchi on 2017/06/23.
//  Copyright © 2017年 Shogo Funaguchi. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene {
    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        
        
        let background = SKSpriteNode(imageNamed: "background")
        
        background.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        background.size = self.size
        self.addChild(background)
        
        self.fallNagoyaSpeciality()
    }
    
    func fallNagoyaSpeciality() {
        let texture = SKTexture(imageNamed: "0")
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPoint(x:self.size.width*0.5, y:self.size.height*0.5)
        sprite.size = CGSize(width: texture.size().width*0.5, height: texture.size().height*0.5)
        
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: sprite.size)
        
        self.addChild(sprite)
        
        
    }
    
}
