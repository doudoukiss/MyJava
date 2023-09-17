//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/17.
//

import UIKit
/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryPrameters:  [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        
        print(request.url)
        
        RMService.shared.execute(request,
                                 expecting: RMCharacter.self) { result in
//            switch result {
//            case. success(RMCharacter)
            }
        
    }

}
