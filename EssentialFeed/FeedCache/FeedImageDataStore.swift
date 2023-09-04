//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Vishal on 30/07/23.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
