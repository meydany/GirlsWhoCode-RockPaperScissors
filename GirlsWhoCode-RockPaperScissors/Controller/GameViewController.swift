//
//  GameViewController.swift
//  GirlsWhoCode-RockPaperScissors
//
//  Created by Yoli Meydan on 6/26/18.
//  Copyright © 2018 Yoli Meydan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var rockLabel: UILabel!
    @IBOutlet weak var paperLabel: UILabel!
    @IBOutlet weak var scissorLabel: UILabel!
    
    @IBOutlet weak var playerSelectedLabel: UILabel!
    @IBOutlet weak var computerSelectedLabel: UILabel!
    
    @IBOutlet weak var computerItemsStackView: UIStackView!
    
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var computerCountLabel: UILabel!
    
    var playerWins: Int!
    var computerWins: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        playerWins = 0
        computerWins = 0
        
        //small graphic changes
        setupVisual()
        
        //adds gesture recognizers for three labels
        addGestureRecognizers()
        
    }
    
    func setupVisual() {
        playerSelectedLabel.alpha = 0
        computerSelectedLabel.alpha = 0
        
        playerCountLabel.text = "🏅\(playerWins!)"
        computerCountLabel.text = "🏅\(computerWins!)"

        for label in computerItemsStackView.subviews {
            label.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
    
    func addGestureRecognizers() {
        
        //*******************--ROCK--*******************//
        
        let rockTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.handleRockTap(recognizer:)))
        rockTapRecognizer.numberOfTapsRequired = 1
        
        rockLabel.isUserInteractionEnabled = true
        rockLabel.addGestureRecognizer(rockTapRecognizer)
        
        //*******************--PAPER--*******************//
        
        let paperTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.handlePaperTap(recognizer:)))
        paperTapRecognizer.numberOfTapsRequired = 1
        
        paperLabel.isUserInteractionEnabled = true
        paperLabel.addGestureRecognizer(paperTapRecognizer)
        
        //*******************--SCISSORS--*******************//
        
        let scissorTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.handleScissorTap(recognizer:)))
        scissorTapRecognizer.numberOfTapsRequired = 1
        
        scissorLabel.isUserInteractionEnabled = true
        scissorLabel.addGestureRecognizer(scissorTapRecognizer)
        
    }
    
    //handles rock tap
    @objc func handleRockTap(recognizer: UIGestureRecognizer) {
        GameManager.setSelectedValue(value: GameValue.ROCK)
        showSelections()
    }
    
    //handles paper tap
    @objc func handlePaperTap(recognizer: UIGestureRecognizer) {
        GameManager.setSelectedValue(value: GameValue.PAPER)
        showSelections()
    }
    
    //handles scissor tap
    @objc func handleScissorTap(recognizer: UIGestureRecognizer) {
        GameManager.setSelectedValue(value: GameValue.SCISSOR)
        showSelections()
    }
    
    func showSelections() {
        let currentPlayerValue = GameManager.currentPlayerValue!
        let currentComputerValue = GameManager.currentComputerValue!
        
        //update labels
        playerSelectedLabel.text = currentPlayerValue.rawValue
        playerSelectedLabel.alpha = 1
        
        computerSelectedLabel.text = currentComputerValue.rawValue
        computerSelectedLabel.alpha = 1
        
        //increment score of winner, do nothing if it is a tie
        switch GameManager.getGameResult() {
            case GameResult.WIN:
                playerWins += 1
            case GameResult.LOSE:
                computerWins += 1
            default: //TIE
                break
        }
        
        playerCountLabel.text = "🏅\(playerWins!)"
        computerCountLabel.text = "🏅\(computerWins!)"
    }
    
  
 
 
    
}
