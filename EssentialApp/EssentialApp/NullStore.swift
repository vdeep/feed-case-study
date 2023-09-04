//
//  NullStore.swift
//  EssentialApp
//
//  Created by Vishal on 03/09/23.
//

import Foundation
import EssentialFeed

class NullStore: FeedStore {
    func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        completion(.success(()))
    }

    func insert(_ feed: [EssentialFeed.LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        completion(.success(()))
    }

    func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.success(.none))
    }
}

// MARK: - Result<Data?, Error>
extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {}

    func retrieve(dataForURL url: URL) throws -> Data? { .none }
}
