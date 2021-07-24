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
            var row = [Tile]()
            for j in 0 ..< numberOfCols {
                let x: CGFloat = CGFloat(j) * blockSize
                let y: CGFloat = CGFloat(i) * blockSize
                let tile = Tile(blockSize: blockSize)
                tile.getTile().frame.origin = CGPoint(x: x, y: y)
                gridView.addSubview(tile.getTile())
                row.append(tile)
            }
            tiles.append(row)
        }
    }
    
    func collapseColumn(){
        for i in 0 ..< numberOfRows - 1{
            for j in 0 ..< numberOfCols{
                if(!tiles[i][j].isEmpty()){
                    if(tiles[i + 1][j].collidable(incomingTile: tiles[i][j])){
                        tiles[i + 1][j].combine(incomingTile: tiles[i][j])
                        tiles[i][j].reset()
                    }
                }
            }
        }
    }
    
    func collapseRow(){
        var deletedRows = 0
        var count = 0
        
        while count < numberOfRows - 1 - deletedRows{
            let row = numberOfRows - 1 - count;
            let rowValue = tiles[row][0].getValue() +
                tiles[row][1].getValue() +
                tiles[row][2].getValue() +
                tiles[row][3].getValue()
            
            if(tiles[row][0].getValue() != 0 && tiles[row][1].getValue() != 0 && tiles[row][2].getValue() != 0 && tiles[row][3].getValue() != 0){
                
                if(rowValue >= 25){
                    
                    tiles[row][0].reset()
                    tiles[row][1].reset()
                    tiles[row][2].reset()
                    tiles[row][3].reset()
                    for i in (0 ..< row).reversed() {
                        tiles[i + 1][0].setValue(newValue: tiles[i][0].getValue())
                        tiles[i][0].reset()
                        tiles[i + 1][1].setValue(newValue: tiles[i][1].getValue())
                        tiles[i][1].reset()
                        tiles[i + 1][2].setValue(newValue: tiles[i][2].getValue())
                        tiles[i][2].reset()
                        tiles[i + 1][3].setValue(newValue: tiles[i][3].getValue())
                        tiles[i][3].reset()
                    }
                    deletedRows += 1
                }
            }
            
            count+=1
            
        }
    }
    
    func dropTile(tile: Tile, location: Int) -> Bool{
        for i in (0 ..< numberOfRows).reversed() {
            if(tiles[i][location].isEmpty()){
                tiles[i][location].combine(incomingTile: tile)
                tiles[i][location].toggleLabel()
                return true
            }
            if(i-1 > 0){
                if(tiles[i][location].collidable(incomingTile: tile) && tiles[i-1][location].isEmpty()){
                    tiles[i][location].combine(incomingTile: tile)
                    return true
                }
            }else{
                if(tiles[i][location].collidable(incomingTile: tile)){
                    tiles[i][location].combine(incomingTile: tile)
                    return true
                }
            }
        }
        return false
    }
}
