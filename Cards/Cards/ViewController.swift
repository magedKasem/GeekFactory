//
//  ViewController.swift
//  Cards
//
//  Created by Maged Kasem on 4/16/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonCollection : [UIButton]!
    
    var imageCollection = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8")]
  
    var firstButton : UIButton!
    var secondButton : UIButton!
    var count = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in buttonCollection{
            let randomIndex = Int(arc4random_uniform(UInt32(imageCollection.count)))
            
            button.setImage(UIImage(named: "card"), for: .normal)
            button.setImage(imageCollection[randomIndex], for: .selected)
            button.tag = randomIndex+1
            button.addTarget(self, action: #selector(ViewController.selected), for: .touchUpInside)
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func selected(_ sender: UIButton) {
        sender.isSelected = true
        if count == 0 {
            firstButton = sender
            count += 1
        }
        else if count == 1 {
            secondButton = sender
            match(firstButton, secondButton)
            count = 0
            firstButton = nil
            secondButton = nil
        }
 
    }
    
    func match(_ firstButton: UIButton, _ secondButton: UIButton) {
        if (firstButton.tag == secondButton.tag) {
            firstButton.isEnabled = false
            secondButton.isEnabled = false
            firstButton.setImage(UIImage(named: "\(firstButton.tag)"), for: .normal)
            secondButton.setImage(UIImage(named: "\(secondButton.tag)"), for: .normal)

        }
        else{
            view.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.view.isUserInteractionEnabled = true
                firstButton.isSelected = false
                secondButton.isSelected = false
                firstButton.setImage(UIImage(named: "card"), for: .normal)
                secondButton.setImage(UIImage(named: "card"), for: .normal)
            })
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
