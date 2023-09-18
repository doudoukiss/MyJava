//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/18.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
}
