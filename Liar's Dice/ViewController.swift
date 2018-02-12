//
//  ViewController.swift
//  Liar's Dice
//
//  Created by Rory Haynes on 01/02/2018.
//  Copyright © 2018 Rory Haynes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanCallFunction {
    

    
    //MARK:- Outlet connections
    @IBOutlet weak var hideScreenImage: UIImageView! // to hide the dice results when screen is lowered
    
    @IBOutlet weak var dice1: UIImageView!
    
    @IBOutlet weak var dice2: UIImageView!
    
    @IBOutlet weak var dice3: UIImageView!
    
    @IBOutlet weak var dice4: UIImageView!
    
    @IBOutlet weak var dice5: UIImageView!
    
    @IBOutlet weak var snowyFace: UIImageView!
    
    
    
    @IBOutlet weak var hideViewButtonImage: UIImageView!
    
   
    
    @IBOutlet weak var hideViewButton: UIButton! //linked to functions below for tap or long press
    
    
    
    
    @IBOutlet weak var rollDiceButtonImage: UIImageView!
    
    @IBOutlet weak var rollDiceButtonAvailable: UIButton! //so I can disable the button
    
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
    
    let hideDiceArray = [UIImage(named: "eyes-covered"),UIImage(named: "eyes-covered2")]
    
    
    
    var diceRolling : Bool = false
    
    var hideDice : Bool = false //to hide dice
    
    //MARK:- Random numbers for dice calculated, and images assigned
    
    @objc func updateDiceImages() {
        
        snowyFace.image = UIImage(named: "snowyplaceholder2")
        
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
        
        //disable button button, change to reroll
        rollDiceButtonImage.image = UIImage(named: "questionmark")
        
       
        
        rollCount += 1
        
        if rollCount == 6 {
            
            diceTimer.invalidate()
            
            snowyFace.image = UIImage(named: "snowyplaceholder")
            
            rollCount = 0
            
            rollDiceButtonImage.image = UIImage(named: "reroll")
            rollDiceButtonAvailable.isEnabled = true
        }
        
       
    }

    
    //MARK:- ViewDidLoad

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideScreenImage.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        hideViewButton.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        hideViewButton.addGestureRecognizer(longGesture)

    }
    
    //MARK:- Handle tap or long press
    
    @objc func normalTap(_ sender: UIGestureRecognizer){
        print("Normal tap")
        hideDicefunc()
        
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")
            //TODO:- add functions
            if hideDice == true{
                
                hideScreenImage.isHidden = false
               
                
            }
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //TODO:- add functions
            //Do Whatever You want on Began of Gesture
            
            if hideDice == true{
                
                hideScreenImage.isHidden = true
               
                
            }
        }
    }
    
    func startRollingDice(){
        
        if diceRolling == false {
            
            rollDiceButtonAvailable.isEnabled = false
            
            diceTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateDiceImages), userInfo: nil, repeats: true)
            
            diceRolling = true
            
            
            
            
        }
            
        else if diceRolling == true {
            
           
            rerollPopUp()
            
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
    
    func rerollPopUp(){
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rerollPopUp") as! RerollPopUp
        self.addChildViewController(popUpVC)
        //TODO:- check this is right
        popUpVC.viewControllerDelegate = self
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParentViewController: self)
        
    }
    
    func changeRollingStatus(){
        
        diceRolling = false
        
    }

    func hideDicefunc(){
        if hideDice == false {
            
            hideScreenImage.isHidden = false
            hideViewButtonImage.image = UIImage(named: "secret2")
            let animatedImage = UIImage.animatedImage(with: hideDiceArray as! [UIImage], duration: 1.0)
            hideScreenImage.image = animatedImage
            hideDice = true
            
            
            
        }
        
        else if hideDice == true{
            
          hideScreenImage.isHidden = true
            hideViewButtonImage.image = UIImage(named: "secret")
            hideDice = false
            
            
            }
    }

}

