//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/20.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
