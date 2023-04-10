//
//  GameViewController.swift
//  20230407_Rock_Paper_Scissors
//
//  Created by Yen Lin on 2023/4/7.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var robotEmojiLabel: UILabel!
    @IBOutlet weak var userEmojiLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var handTypeButtons: [UIButton]!
    @IBOutlet weak var playAgainButton: UIButton!
    
    //初始值
    var userHand: handType = .rock
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(initialView: true)

    }

    
    func updateUI(initialView: Bool = true){
        
        switch initialView{
        case true:
            handTypeButtons[0].isHidden = false
            handTypeButtons[1].isHidden = false
            handTypeButtons[2].isHidden = false
            
            robotEmojiLabel.isHidden = true
            userEmojiLabel.isHidden = true
            playAgainButton.isHidden = true
            statusLabel.text = gameState.start.status
            
        case false:
            handTypeButtons[0].isHidden = true
            handTypeButtons[1].isHidden = true
            handTypeButtons[2].isHidden = true
            
            robotEmojiLabel.isHidden = false
            userEmojiLabel.isHidden = false
            playAgainButton.isHidden = false
            statusLabel.isHidden = false
        }
        
    }
    
    func robotPlay(){
        
        //隨機出
        var robotHand = handType.allCases.randomElement()!
        robotEmojiLabel.text = robotHand.emoji
        
        //判斷輸贏
        if userHand == robotHand{
            statusLabel.text = gameState.draw.status
        }else if robotHand == handType.rock && userHand == handType.paper{
            statusLabel.text = gameState.win.status
        }else if robotHand == handType.rock && userHand == handType.scissors{
            statusLabel.text = gameState.loss.status
        }else if robotHand == handType.paper && userHand == handType.rock{
            statusLabel.text = gameState.loss.status
        }else if robotHand == handType.paper && userHand == handType.scissors{
            statusLabel.text = gameState.win.status
        }else if robotHand == handType.scissors && userHand == handType.rock{
            statusLabel.text = gameState.win.status
        }else if robotHand == handType.scissors && userHand == handType.paper{
            statusLabel.text = gameState.loss.status
        }else{
            statusLabel.text = "Error!"
        }
        
    }
    
    @IBAction func chooseRock(_ sender: UIButton) {
        
        userHand = .rock
        userEmojiLabel.text = userHand.emoji
        robotPlay()
        updateUI(initialView: false)
    }
    
    @IBAction func choosePaper(_ sender: UIButton) {
        userHand = .paper
        userEmojiLabel.text = userHand.emoji
        robotPlay()
        updateUI(initialView: false)
    }
    
    @IBAction func chooseScissors(_ sender: UIButton) {
        userHand = .scissors
        userEmojiLabel.text = userHand.emoji
        robotPlay()
        updateUI(initialView: false)
    }
    
    @IBAction func playAgainAction(_ sender: Any) {
        statusLabel.text = gameState.start.status
        updateUI(initialView: true)
        
    }
    
}
