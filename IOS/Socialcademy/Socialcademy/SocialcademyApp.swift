//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by Seattle on 2023/7/6.
//

import SwiftUI
import Firebase

@main
struct SocialcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
