//
//  ImageCommentsEndpointTests.swift
//  EssentialFeedTests
//
//  Created by Vishal on 27/08/23.
//

import XCTest
import EssentialFeed

final class ImageCommentsEndpointTests: XCTestCase {

    func test_feed_endpointURL() {
        let imageID = UUID(uuidString: "944941E4-13AA-4348-A08E-C5FF119D6FB3")!
        let baseURL = URL(string: "http://base-url.com")!

        let received = ImageCommentsEndpoint.get(imageID).url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/image/944941E4-13AA-4348-A08E-C5FF119D6FB3/comments")!

        XCTAssertEqual(received, expected)
    }

}
