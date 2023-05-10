//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Vishal on 10/05/23.
//

import XCTest

class URLSessionHTTPClient {
    let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _ in }
    }
}

final class URLSessionHTTPClientTests: XCTestCase {

    func test_getFromURL_createdDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)

        XCTAssertEqual(session.receivedURLs, [url])
    }

    // MARK: - helpers
    private final class URLSessionSpy: URLSession {
        var receivedURLs: [URL] = []
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)

            return FakeURLSessionDataTask()
        }
    }

    private final class FakeURLSessionDataTask: URLSessionDataTask {}

}
