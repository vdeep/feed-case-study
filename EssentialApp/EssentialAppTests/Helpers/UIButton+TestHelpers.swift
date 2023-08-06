//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Vishal on 24/07/23.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
