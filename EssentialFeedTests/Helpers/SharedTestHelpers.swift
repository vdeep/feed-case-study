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
