//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Justin Vallely on 5/19/15.
//  Copyright (c) 2015 JMVapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = circles, 2 = crosses
    var activePlayer = 1
    
    // Used to prevent any further play when someone wins
    var gameActive = true
    
    // Keep track of which player is in which grid location
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // All possible grid location combinations that constitute a win when all equal the same player number
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    // Play again and reset all the initializing variables
    @IBAction func playAgainPressed(sender: AnyObject) {
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button: UIButton
        
        for var i = 0; i < 9; i++ {
        
            button = view.viewWithTag(i) as! UIButton
        
            button.setImage(nil, forState: .Normal)
        }
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }
    
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        // If the grid location is empty and there is no winner yet
        if gameState[sender.tag] == 0 && gameActive == true {
            
            
            var image = UIImage()
            
            // Set the player number to the array location corresponding to the grid location clicked
            gameState[sender.tag] = activePlayer
            
            // Set the image corresponding to the player number
            if activePlayer == 1 {
                image = UIImage(named: "nought.png")!
                activePlayer = 2
            } else {
                image = UIImage(named: "cross.png")!
                activePlayer = 1
            }
        
            // use "sender" instead of "button" to get the button that was clicked instead of writing 9 times the code for each button
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
            
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = "O wins!"
                    
                    if gameState[combination[0]] == 2 {
                        labelText = "X wins!"
                    }
                    
                    gameOverLabel.text = labelText
                    
                    gameOverLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                    })
                    
                    gameActive = false
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        // Called when everything is created but not yet displayed on the screen
        
    }

}

