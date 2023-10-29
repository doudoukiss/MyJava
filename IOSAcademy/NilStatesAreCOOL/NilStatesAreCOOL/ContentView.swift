//
//  ContentView.swift
//  NilStatesAreCOOL
//
//  Created by Seattle on 2023/10/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(label: {
                Label("Notification", systemImage: "bell")
            }, description: {
                Text("You have no activity yet.")
                    .bold()
            }, action: {
                Button("Do Stuff") {
                    // Handel that
                }
            }
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
