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
    
    var recivingName1 : String?
    var recivingName2 : String?
    
    //? för det kan vara nil om vi inte lyckas får nånting
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerName1.text = recivingName1
        playerName2.text = recivingName2
    }
    
   
    

    

}
