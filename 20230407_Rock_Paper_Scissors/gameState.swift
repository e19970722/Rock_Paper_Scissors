//
//  gameState.swift
//  20230407_Rock_Paper_Scissors
//
//  Created by Yen Lin on 2023/4/7.
//

enum gameState{
    case start, win, loss, draw
    
    var status: String{
        switch self{
        case .start:
            return "Rock, Paper or Scissors?"
        case .win:
            return "OK, You Win!"
        case .loss:
            return "Hey Loser!"
        case .draw:
            return "Be careful next time"
        }
    }
}
