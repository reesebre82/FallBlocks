//
//  Tile.swift
//  FallBlocks
//
//  Created by Brendan Reese on 7/22/21.
//

import Foundation
import UIKit

class Tile{
    private var value: Int
    private var valueLabel: UILabel
    private var tileView: UIView
    private var shouldShow: Bool = false {
        didSet {
            show()
        }
    }
    
    init(){
        value = 0
        tileView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        valueLabel = UILabel(frame: tileView.frame)
        tileView.isUserInteractionEnabled = false
    }
    
    init(blockSize: CGFloat){
        value = 0
        tileView = UIView(frame: CGRect(x: 0, y: 0, width: blockSize, height: blockSize))
        tileView.layer.borderWidth = 1.0
        tileView.layer.borderColor = UIColor.black.cgColor
        tileView.isUserInteractionEnabled = false
        
        valueLabel = UILabel(frame: tileView.frame)
    }
    
    func getValue() -> Int { return value }
    func getTile() -> UIView { return tileView }
    func toggleLabel(){ shouldShow = !shouldShow }
    
    func show(){
        if(shouldShow){
            valueLabel.text = "\(value)"
            tileView.addSubview(valueLabel)
        }
        else{
            valueLabel.removeFromSuperview()
        }
    }
    
    func collidable(incomingTile: Tile) -> Bool{
        if(incomingTile.getValue() == getValue()){
            return true
        }
        return false
    }
}
