//
//  ViewController.swift
//  Bull’sEye
//  Created by Maged Kasem on 4/8/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    var targetValue = 0
    var currentValue = 0
    var round = 0
    var score = 0
    var defaultCurrentValue = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Normal"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Highlighted"), for: .highlighted)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reset()  {
        self.startNewRound()
        self.updateLabels()
    }

    @IBAction func play(_ sender: Any) {
        let awayFromTarget = abs(targetValue - currentValue)
        var points = 100 - awayFromTarget
        
        let messageTitle: String
        
        if awayFromTarget == 0 {
            messageTitle = "Perfect!"
            points += 100
        }
        else if awayFromTarget < 5 {
            messageTitle = "You almost had it!"
            if awayFromTarget == 1 {
                points += 50
            }
        }
        else if awayFromTarget < 10 {
            messageTitle = "Pretty good!"
        }
        else {
            messageTitle = "Not even close..."
        }
        score += points
        let message = "You scored \(points) points \n Your value is \(currentValue)\n Your Target is \(targetValue)"
        let alert = UIAlertController(title: messageTitle,message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,handler: nil)
        reset()
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        currentValue = lroundf(slider.value)
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        targetLabel.text = String(targetValue)
        
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(defaultCurrentValue)
    }

   
    @IBAction func startOver(_ sender: Any) {
        startNewGame()
        updateLabels()
    }
}
