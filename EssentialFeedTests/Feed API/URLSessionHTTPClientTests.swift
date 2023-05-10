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
        session.dataTask(with: url) { _, _, _ in }.resume()
    }
}

final class URLSessionHTTPClientTests: XCTestCase {

    func test_getFromURL_resumesDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(task, for: url)

        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)

        XCTAssertEqual(task.requestCallCount, 1)
    }

    // MARK: - helpers
    private final class URLSessionSpy: URLSession {
        var stubs: [URL: URLSessionDataTask] = [:]

        func stub(_ task: URLSessionDataTask, for url: URL) {
            stubs[url] = task
        }

        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            return stubs[url] ?? FakeURLSessionDataTask()
        }
    }

    private final class FakeURLSessionDataTask: URLSessionDataTask {
        override func resume() {}
    }

    private final class URLSessionDataTaskSpy: URLSessionDataTask {
        var requestCallCount = 0

        override func resume() {
            requestCallCount += 1
        }
    }

}
