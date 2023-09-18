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
        
//        let request = RMRequest(
//            endpoint: .character,
//            queryPrameters:  [
//                URLQueryItem(name: "name", value: "rick"),
//                URLQueryItem(name: "status", value: "alive")
//            ]
//        )
//
//        print(request.url)
        
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllChractersResponse.self) { result in
            switch result {
            case .success(let model):
                //print(String(describing: model))
                print("Total:" + String(model.info.count))
                print("Total Pages:" + String(model.info.pages))
                print("Page Result Count" + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
    }
}
