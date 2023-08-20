//
//  FeedImageDataMapperTests.swift
//  EssentialFeedTests
//
//  Created by Vishal on 20/08/23.
//

import XCTest
import EssentialFeed

final class FeedImageDataMapperTests: XCTestCase {

    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let samples = [199, 201, 300, 400, 500]

        try samples.forEach { code in
            XCTAssertThrowsError(try FeedImageDataMapper
                .map(
                    anyData(),
                    from: HTTPURLResponse(statusCode: code)
                )
            )
        }
    }

    func test_map_deliversInvalidDataErrorOn200HTTPResponseWithEmptyData() {
        let emptyData = Data()

        XCTAssertThrowsError(
            try FeedImageDataMapper.map(
                emptyData,
                from: HTTPURLResponse(statusCode: 200)
            )
        )
    }
}
