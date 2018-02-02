//
//  ViewController.swift
//  Liar's Dice
//
//  Created by Rory Haynes on 01/02/2018.
//  Copyright © 2018 Rory Haynes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK:- Outlet connections
    @IBOutlet weak var hideScreenImage: UIImageView! // to hide the dice results when screen is lowered
    
    @IBOutlet weak var dice1: UIImageView!
    
    @IBOutlet weak var dice2: UIImageView!
    
    @IBOutlet weak var dice3: UIImageView!
    
    @IBOutlet weak var dice4: UIImageView!
    
    @IBOutlet weak var dice5: UIImageView!
    
    @IBOutlet weak var snowyFace: UIImageView!
    
    @IBAction func rollDiceButton(_ sender: UIButton) {
        
    updateDiceImages()
        
    }
    
    
      //MARK:- Variables etc.
    
    var diceNumber1 : Int = 1
    var diceNumber2 : Int = 1
    var diceNumber3 : Int = 1
    var diceNumber4 : Int = 1
    var diceNumber5 : Int = 1
    var diceNumber6 : Int = 1
    
    let diceArray = ["dieRed1","dieRed2","dieRed3","dieRed4","dieRed5","dieRed6"] //array of dice images
    
    var lockDice : Bool = false //to stop dice changing
    
    //MARK:- Random numbers for dice calculated, and images assigned
    
    func updateDiceImages() {
        
        diceNumber1 = Int(arc4random_uniform(6))
        diceNumber2 = Int(arc4random_uniform(6))
        diceNumber3 = Int(arc4random_uniform(6))
        diceNumber4 = Int(arc4random_uniform(6))
        diceNumber5 = Int(arc4random_uniform(6))
        
        dice1.image = UIImage(named: diceArray[diceNumber1])
        dice2.image = UIImage(named: diceArray[diceNumber2])
        dice3.image = UIImage(named: diceArray[diceNumber3])
        dice4.image = UIImage(named: diceArray[diceNumber4])
        dice5.image = UIImage(named: diceArray[diceNumber5])
    }
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

