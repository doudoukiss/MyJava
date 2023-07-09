//
//  ProfileView.swift
//  Socialcademy
//
//  Created by Seattle on 2023/7/9.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    var body: some View {
        Button("Sign Out", action: {
            try! Auth.auth().signOut()
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
