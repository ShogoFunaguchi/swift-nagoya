//
//  ViewController.swift
//  HelpNagoyaSpeciality
//
//  Created by Shogo Funaguchi on 2017/06/23.
//  Copyright © 2017年 Shogo Funaguchi. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene()
        
        let view = self.view as! SKView
        
        view.showsFPS = true
        view.showsNodeCount = true
        
        scene.size = view.frame.size
        
        view.presentScene(scene)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

