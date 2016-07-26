//
//  ViewController.swift
//  Noughts And Crosses
//
//  Created by Rob Percival on 02/10/2015.
//  Copyright © 2015 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = noughts, 2 = crosses
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive = true

    @IBOutlet var playAgainButton: UIButton!
  
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        var buttonToClear : UIButton
        
        for i in 0 ..< 9 {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
        
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            
                activePlayer = 2
            
            } else {
            
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
                activePlayer = 1
            
            }
            
            for combination in winningCombinations {
                
                
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "Noughts have won!"
                        
                    } else {
                        
                        gameOverLabel.text = "Crosses have won!"
                        
                    }
                    
                    endGame()
                }
                
            }
            
            if gameActive == true {
            
                gameActive = false
            
                for buttonState in gameState {
                
                    if buttonState == 0 {
                    
                        gameActive = true
                    
                    }
                
                }
            
                if gameActive == false {
                
                    gameOverLabel.text = "It's a draw!"
                
                    endGame()
                
                }
         
            }
        }
        
    }
    
    func endGame() {
    
        gameOverLabel.hidden = false
        playAgainButton.hidden = false
    
        UIView.animateWithDuration(0.5, animations: { () -> Void in
    
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
    
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
    
        })

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

