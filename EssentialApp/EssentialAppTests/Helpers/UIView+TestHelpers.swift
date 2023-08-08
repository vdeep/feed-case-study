//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Vishal on 08/08/23.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
