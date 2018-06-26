//
//  GameManager.swift
//  GirlsWhoCode-RockPaperScissors
//
//  Created by Yoli Meydan on 6/26/18.
//  Copyright © 2018 Yoli Meydan. All rights reserved.
//

import Foundation

enum GameValue: String {
    case ROCK = "👊" //0
    case PAPER = "✋" //1
    case SCISSOR = "✌️" //2
}

enum GameResult {
    case WIN
    case LOSE
    case TIE
}


class GameManager {
    
    static var currentPlayerValue: GameValue? = nil
    static var currentComputerValue: GameValue? = nil
    
    static func setSelectedValue(value: GameValue!) {
        currentPlayerValue = value
        currentComputerValue = getRandomComputerValue() //get random turn for computer
    }
    
    static func getRandomComputerValue() -> GameValue {
        switch Int(arc4random_uniform(3)) { //convers int to GameValue
            case 0:
                return GameValue.init(rawValue: "👊")!
            case 1:
                return GameValue.init(rawValue: "✋")!
            case 2:
                return GameValue.init(rawValue: "✌️")!
            default:
                return GameValue.ROCK //won't happen
        }
    }
    
    static func getGameResult() -> GameResult {
        if currentPlayerValue == currentComputerValue { //tie if both pick the same value
            return GameResult.TIE
        }
        
        switch currentPlayerValue! { //basic rock paper scissors logic
            case GameValue.ROCK:
                return currentComputerValue == GameValue.SCISSOR ? GameResult.WIN : GameResult.LOSE
            case GameValue.PAPER:
                return currentComputerValue == GameValue.ROCK ? GameResult.WIN : GameResult.LOSE
            case GameValue.SCISSOR:
                return currentComputerValue == GameValue.PAPER ? GameResult.WIN : GameResult.LOSE
        }
    }
    
    
}
