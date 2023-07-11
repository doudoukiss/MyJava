//
//  ContentView.swift
//  UIviewRep
//
//  Created by Seattle on 2023/7/9.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePickerView = false
    @State private var selectedImage: UIImage?
    var body: some View {
        VStack {
            Text("Choose an Image!")
                .font(.largeTitle)
                .padding()
            Spacer()
            imageView
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    showImagePickerView = true
                }
                .padding()
            Spacer()
            Spacer()
        }
        .sheet(isPresented: $showImagePickerView) {
            ImagePickerView(selectedImage: $selectedImage)
        }
    }
    
    var imageView: Image {
        if let selectedImage = selectedImage {
            return Image(uiImage: selectedImage)
        } else {
            return Image(systemName: "photo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
