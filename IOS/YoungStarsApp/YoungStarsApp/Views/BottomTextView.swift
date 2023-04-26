//
//  BottomTextView.swift
//  YoungStarsApp
//
//  Created by Seattle on 2023/4/26.
//

import SwiftUI

struct BottomTextView: View {
    let str: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(str).font(.body).bold().padding()
            Spacer()
        }.background(GameColor.accent)
    }
}

struct BottomTextView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextView(str: "Young Stars")
    }
}
