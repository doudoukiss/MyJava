//
//  ViewController.swift
//  Instagram
//
//  Created by Seattle on 2023/9/6.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("failed to sign out")
        }
    }
    
    private func handleNotAuthenticated() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show Log In
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }


}

