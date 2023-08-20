//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Vishal on 01/07/23.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 1)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func makeItemsJSON(_ items: [[String: Any]]) -> Data {
    let json = ["items": items]
    return try! JSONSerialization.data(withJSONObject: json)
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(
            url: anyURL(),
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
    }
}

extension Date {
    func adding(seconds: TimeInterval) -> Date {
        self + seconds
    }

    func adding(minutes: Int) -> Date {
        Calendar(identifier: .gregorian)
            .date(byAdding: .minute, value: minutes, to: self)!
    }

    func adding(days: Int) -> Date {
        Calendar(identifier: .gregorian)
            .date(byAdding: .day, value: days, to: self)!
    }
}
