//
//  PlayerViewController.swift
//  Tic Tac Toe Game
//
//  Created by Ismenia Brandao on 2021-11-29.
//

import UIKit

class PlayerViewController: UIViewController {
    
    
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    let segueToGameViewId = "segueToGameView"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: segueToGameViewId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == segueToGameViewId {
            let destinationViewController = segue.destination as! GameViewController
            
            destinationViewController.recivingName1 = player1.text
            destinationViewController.recivingName2 = player2.text
        }
    }


}
