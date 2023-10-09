//
//  ViewController.swift
//  LanLanMusic
//
//  Created by Seattle on 2023/10/8.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Browse"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSettings))
        fetchData()
    }
    
    private func fetchData() {
        APICaller.shared.getRecommendations(genres: ["blues"]){ result in
            switch result {
            case .success(let model): break
            case .failure(let error): break
            }
        }
//        APICaller.shared.getRecommendedGenres { result in
//            switch result {
//            case .success(let model): break
//            case .failure(let error): break
//            }
//        }
    }
    
    
    @objc func didTapSettings() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }


}

