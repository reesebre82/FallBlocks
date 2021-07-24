//
//  Tile.swift
//  FallBlocks
//
//  Created by Brendan Reese on 7/22/21.
//

import Foundation
import UIKit

class Tile{
    private var value: Int{
        didSet{
            valueLabel.text = "\(value)"
        }
    }
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
        valueLabel.textAlignment = .center
    }
    
    func getValue() -> Int { return value }
    func getTile() -> UIView { return tileView }
    func toggleLabel() { shouldShow = !shouldShow }
    func isEmpty() -> Bool { return value == 0 }
    
    private func show(){
        if(shouldShow){
            valueLabel.text = "\(value)"
            tileView.addSubview(valueLabel)
        }
        else{
            valueLabel.removeFromSuperview()
            tileView.backgroundColor = .white
        }
    }
    
    func collidable(incomingTile: Tile) -> Bool{
        if(incomingTile.getValue() == getValue()){
            return true
        }
        return false
    }
    
    func combine(incomingTile: Tile){
        value = value + incomingTile.getValue()
        setColor()
    }
    
    func setRandomValue(){
        value = Int.random(in: 1..<6)
        setColor()
    }
    func setColor(){
        tileView.backgroundColor = ColorPalette.getColor(value)
    }
    func setValue(newValue: Int){
        value = newValue
        if(value == 0){
            shouldShow = false
            show()
        }
        else{
            shouldShow = true
            show()
        }
        setColor()
    }
    
    func reset(){
        shouldShow = false
        value = 0
    }
}
