//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Vishal on 26/07/23.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
