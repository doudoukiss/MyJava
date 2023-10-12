//
//  HapticsManager.swift
//  LanLanMusic
//
//  Created by Seattle on 2023/10/8.
//

import Foundation

import UIKit

final class HapticsManager {
    static let shared = HapticsManager()

    private init() {}

    public func vibrateForSelection() {
        DispatchQueue.main.async {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
    }

    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(type)
        }
    }
}
