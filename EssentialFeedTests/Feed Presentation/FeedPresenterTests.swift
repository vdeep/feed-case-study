//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Vishal on 26/07/23.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

final class FeedPresenterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - helpers
    
    private final class ViewSpy {
        let messages = [Any]()
    }

}
