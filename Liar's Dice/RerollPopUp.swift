//
//  RerollPopUp.swift
//  Liar's Dice
//
//  Created by Rory Haynes on 07/02/2018.
//  Copyright © 2018 Rory Haynes. All rights reserved.
//

import UIKit


//set up protocol

protocol CanCallFunction {
    
    func changeRollingStatus()
    func startRollingDice()
    
}

class RerollPopUp: UIViewController {
    
    var viewControllerDelegate : CanCallFunction?
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate() //to animate the pop up

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func rerollButton(_ sender: UIButton) {
        
        //TODO:- review delegates, call function from other VC, or change var or other VC
        
        viewControllerDelegate?.changeRollingStatus()
        
        viewControllerDelegate?.startRollingDice()
        
         self.removeAnimate() //remove with animation
    }
    

    @IBAction func noRerollButton(_ sender: UIButton) {
        
        self.removeAnimate()
        
    }
    
    
    //MARK:- Pop up animation code from github
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

}
