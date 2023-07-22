//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Vishal on 20/07/23.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    private(set) lazy var view = bound(UIRefreshControl())
    
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func bound(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onChange = { viewModel in
            if viewModel.isLoading {
                view.beginRefreshing()
            } else {
                view.endRefreshing()
            }
        }
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
