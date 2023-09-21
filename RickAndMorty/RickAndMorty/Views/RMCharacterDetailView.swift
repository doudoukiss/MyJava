//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/20.
//

import UIKit

final class RMCharacterDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
