//
//  handType.swift
//  20230407_Rock_Paper_Scissors
//
//  Created by Yen Lin on 2023/4/7.
//

enum handType: CaseIterable{
    case rock
    case paper
    case scissors
    
    var emoji: String{
        switch self {
        case .rock:
            return "✊"
        case .paper:
            return "🤚"
        case .scissors:
            return "✌️"
        }
    }
}
