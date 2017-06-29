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
    
    
    // 丼
    var bowl:SKSpriteNode?
    
    var timer: Timer?
    
    
    override func didMove(to view: SKView) {
        
        //重力
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        
        //バックグランドイメージ
        let background = SKSpriteNode(imageNamed: "background")
        
        background.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        background.size = self.size
        self.addChild(background)
        
        
        // どんぶり
        let bowlTexture = SKTexture(imageNamed: "bowl")
        let bowl = SKSpriteNode(texture: bowlTexture)
        bowl.position = CGPoint(x: self.size.width*0.5,y: 100)
        bowl.size = CGSize(width: bowlTexture.size().width*0.5, height: bowlTexture.size().height*0.5)
        
        bowl.physicsBody = SKPhysicsBody(texture: bowlTexture, size: bowl.size)
        bowl.physicsBody?.isDynamic = false
        
        self.bowl = bowl
        self.addChild(bowl)
        
        self.fallNagoyaSpeciality()
    
        
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(GameScene.fallNagoyaSpeciality), userInfo: nil, repeats: true)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let action = SKAction.move(to: CGPoint(x: location.x, y: 100),  duration: 0.2)
            self.bowl?.run(action)
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let action = SKAction.move(to: CGPoint(x: location.x, y: 100), duration: 0.2)
            self.bowl?.run(action)
            
        }
    }
    
    func fallNagoyaSpeciality() {
        
        let index = Int(arc4random_uniform(7))
        
        let texture = SKTexture(imageNamed: "\(index)")
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPoint(x:self.size.width*0.5, y:self.size.height)
        sprite.size = CGSize(width: texture.size().width*0.5, height: texture.size().height*0.5)
        
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: sprite.size)
        
        self.addChild(sprite)

    }
    
    
    
}
