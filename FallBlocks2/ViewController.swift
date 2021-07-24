//
//  ViewController.swift
//  FallBlocks2
//
//  Created by Brendan Reese on 7/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game = Game(view: self.view, numRows:  5, numCols: 4)
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = event?.allTouches?.first {
            let location:CGPoint = touch.location(in: touch.view)
            game.dropTileAtLocation(location: location)
        }
    }
}

