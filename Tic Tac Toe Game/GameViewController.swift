//
//  GameViewController.swift
//  Tic Tac Toe Game
//
//  Created by Ismenia Brandao on 2021-11-29.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var playerName1: UILabel!
    @IBOutlet weak var playerName2: UILabel!
    
    @IBOutlet weak var player1ScoreNameLabel: UILabel!
    @IBOutlet weak var player2ScoreNameLabel: UILabel!
    
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    
    var recivingName1 : String?
    var recivingName2 : String?  //? för det kan vara nil om vi inte lyckas får nånting
    
    // Bottons Code
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4 , 5], [6, 7, 8], [0, 3, 6], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    
    @IBOutlet weak var wonLabel: UILabel!
    
    // Bottons table
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true) {
            
            gameState[sender.tag-1] = activePlayer // with this I cant override it
            if (activePlayer == 1 ) {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                activePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations {
            
            if gameState[combination[0]] != 0 && gameState[combination [0]] == gameState[combination[1]] && gameState[combination[1]] == gameState [combination[2]] {
             
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    // Cross has won
                    wonLabel.text = "CROSS HAS WON"
                } else {
                    //Nought has won
                    wonLabel.text = "NOUGHT HAS WON"
                }
                
                playAgainbtn.isHidden = false
                wonLabel.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
        }
    }
        if gameIsActive == false {
            wonLabel.text = "It was a draw"
            wonLabel.isHidden = false
            playAgainbtn.isHidden = false
        }
}
    
    // Button Play Again
    @IBOutlet weak var playAgainbtn: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainbtn.isHidden = true
        wonLabel.isHidden = true
        
        for i in 1...9 {
            
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        print("RESET THE GAME")
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1ScoreNameLabel.text = recivingName1
        player2ScoreNameLabel.text = recivingName2

        playerName1.text = recivingName1
        playerName2.text = recivingName2
        
        
    }
}
