//
//  GameScene.swift
//  HelpNagoyaSpeciality
//
//  Created by Shogo Funaguchi on 2017/06/23.
//  Copyright © 2017年 Shogo Funaguchi. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate {
    
    
    // 丼
    var bowl:SKSpriteNode?
    
    var timer: Timer?
    
    var lowestShape:SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        //重力
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        self.physicsWorld.contactDelegate = self
        
        //バックグランドイメージ
        let background = SKSpriteNode(imageNamed: "background")
        
        background.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        background.size = self.size
        self.addChild(background)
        
        // 落下判定箇所の大きさ
        let lowestShape = SKShapeNode(rectOf: CGSize(width: self.size.width*3, height: 10))
        lowestShape.position = CGPoint(x: self.size.width*0.5, y: -10)
        
        // physicsBody を作って、lowestShapeにぶち込むイメージ
        // ビットマスクも設定。
        let physicsBody = SKPhysicsBody(rectangleOf: lowestShape.frame.size)
        physicsBody.isDynamic = false
        physicsBody.contactTestBitMask = 0x1 << 1
        
        lowestShape.physicsBody = physicsBody
        
        self.addChild(lowestShape)
        self.lowestShape = lowestShape
        
        
        // どんぶり
        let bowlTexture = SKTexture(imageNamed: "bowl")
        let bowl = SKSpriteNode(texture: bowlTexture)
        bowl.position = CGPoint(x: self.size.width*0.5,y: 100)
        bowl.size = CGSize(width: bowlTexture.size().width*0.5, height: bowlTexture.size().height*0.5)
        
        // 重力
        bowl.physicsBody = SKPhysicsBody(texture: bowlTexture, size: bowl.size)
        bowl.physicsBody?.isDynamic = false
        
        self.bowl = bowl
        self.addChild(bowl)
        
//        self.fallNagoyaSpeciality()
//    
        
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
        
        // 落下点と同じビットマスクを置く。
        sprite.physicsBody?.contactTestBitMask = 0x1 << 1
        
        self.addChild(sprite)

    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        
        // 衝突したもののどちらかが落下点のノードだった場合ゲームオーバーの表示を出す。
        if contact.bodyA.node == self.lowestShape || contact.bodyB.node == self.lowestShape {
            
            let sprite = SKSpriteNode(imageNamed: "gameOver")
            sprite.position = CGPoint(x: self.size.width * 0.5, y: self.size.height*0.5)
            
            self.addChild(sprite)
            self.isPaused = true
            self.timer?.invalidate()
        }
    }
    
    
}
