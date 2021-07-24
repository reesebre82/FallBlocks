//
//  Game.swift
//  FallBlocks2
//
//  Created by Brendan Reese on 7/23/21.
//

import Foundation
import UIKit

class Game {
    private var currentTile: Tile
    private var gameGrid: Grid
    private var score: Int
    private var isGameOver: Bool
    private var gameView: UIView
    private let GAME_BOARD_EDGE_OFFSET: CGFloat = 0.05
    
    init(){
        currentTile = Tile()
        gameGrid = Grid(gridWidth: 0, numRows: 0, numCols: 0)
        score = 0
        isGameOver = false
        gameView = UIView()
    }
    
    init(view: UIView, numRows: Int, numCols: Int){
        gameView = UIView(frame: view.frame)
        view.addSubview(gameView)
        
        currentTile = Tile()
        gameGrid = Grid(gridWidth: view.frame.width * (1.00 - GAME_BOARD_EDGE_OFFSET), numRows: numRows, numCols: numCols)
        gameGrid.getGrid().center = gameView.center
        gameView.addSubview(gameGrid.getGrid())
        
        score = 0
        isGameOver = false
    }
    
    private func createRandomTile(){
        
    }
    
    func dropTileAtLocation(location: CGPoint){
        for i in (1 ... gameGrid.getNumCols()).reversed() {
            let section = (gameGrid.getBlockSize() * CGFloat(i-1)) + (GAME_BOARD_EDGE_OFFSET / 2)
            if(location.x > section){
                
                return
            }
        }
    }
}
