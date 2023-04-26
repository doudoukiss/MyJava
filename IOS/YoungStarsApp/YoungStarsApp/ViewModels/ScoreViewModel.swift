//
//  ScoreViewModel.swift
//  YoungStarsApp
//
//  Created by Seattle on 2023/4/26.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses*100/(correctGuesses+incorrectGuesses))
    }
}
