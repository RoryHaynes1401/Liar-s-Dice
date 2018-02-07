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
    
    
    @IBOutlet weak var rollDiceButtonImageView: UIButton!
    
    @IBAction func rollDiceButton(_ sender: UIButton) {
        
        startRollingDice()
        
        
    }
    
    
      //MARK:- Variables etc.
    
    var diceNumber1 : Int = 1
    var diceNumber2 : Int = 1
    var diceNumber3 : Int = 1
    var diceNumber4 : Int = 1
    var diceNumber5 : Int = 1
    var diceNumber6 : Int = 1
    
    var rollCount : Int = 0
    
    var diceTimer: Timer!
    
    //let diceImageArray = ["dieRed1","dieRed2","dieRed3","dieRed4","dieRed5","dieRed6"] //array of dice images
    
    let diceArray = [UIImage(named: "dieRed1"),UIImage(named: "dieRed2"), UIImage(named: "dieRed3"), UIImage(named: "dieRed4"), UIImage(named: "dieRed5"), UIImage(named: "dieRed6")]
    
    
    var diceRolling : Bool = false
    
    var lockDice : Bool = false //to stop dice changing
    
    //MARK:- Random numbers for dice calculated, and images assigned
    
    @objc func updateDiceImages() {
        
        diceNumber1 = Int(arc4random_uniform(6))
        diceNumber2 = Int(arc4random_uniform(6))
        diceNumber3 = Int(arc4random_uniform(6))
        diceNumber4 = Int(arc4random_uniform(6))
        diceNumber5 = Int(arc4random_uniform(6))
        
        dice1.image = diceArray[diceNumber1]
        dice2.image = diceArray[diceNumber2]
        dice3.image = diceArray[diceNumber3]
        dice4.image = diceArray[diceNumber4]
        dice5.image = diceArray[diceNumber5]
        
        rollCount += 1
        
        if rollCount == 6 {
            
            diceTimer.invalidate()
            
            rollCount = 0
        }
        
        print(rollCount)
    }

    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startRollingDice(){
        
        if diceRolling == false {
            
            
            diceTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateDiceImages), userInfo: nil, repeats: true)
            
            diceRolling = true
            
            //TODO:- change dice image
            
            
        }
            
        else if diceRolling == true {
            
           performSegue(withIdentifier: "popUp", sender: nil)
            
            
        }
        
        
    }
    
    //MARK:- shake screen command
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        print("try to shake")
        
        if motion == .motionShake && diceRolling == false { //does nothing if you shake second time
            print("Stirred, not shaken. I hate James Bond.")
            
            startRollingDice()
        }
    }

    


}

