//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Vishal on 16/07/23.
//

import XCTest

final class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {
        
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    // MARK: - helpers
    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
    }
}
