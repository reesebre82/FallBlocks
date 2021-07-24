//
//  Grid.swift
//  FallBlocks
//
//  Created by Brendan Reese on 7/22/21.
//

import Foundation
import UIKit

class Grid{
    
    private var tiles: [[Tile]]
    private var gridView: UIView
    private var numberOfRows: Int
    private var numberOfCols: Int
    private let blockSize: CGFloat
    
    func getGrid() -> UIView { return gridView }
    func getNumCols() -> Int { return numberOfCols }
    func getNumRows() -> Int { return numberOfRows }
    func getBlockSize() -> CGFloat { return blockSize }
    
    init(gridWidth: CGFloat, numRows: Int, numCols: Int){
        tiles = [[Tile]]()
        gridView = UIView(frame: CGRect(x: 0, y: 0, width: gridWidth, height: gridWidth))
        gridView.backgroundColor = UIColor.white
        numberOfRows = numRows
        numberOfCols = numCols
        
        blockSize = gridView.frame.width / CGFloat(numberOfCols)
        
        initBackground()
    }
    
    private func initBackground(){
        
        for i in 0 ..< numberOfRows {
            for j in 0 ..< numberOfCols {
                let x: CGFloat = CGFloat(j) * blockSize
                let y: CGFloat = CGFloat(i) * blockSize
                let tile = Tile(blockSize: blockSize)
                tile.getTile().frame.origin = CGPoint(x: x, y: y)
                gridView.addSubview(tile.getTile())
            }
        }
    }
}
