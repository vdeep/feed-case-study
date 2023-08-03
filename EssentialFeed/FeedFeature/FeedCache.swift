//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Vishal on 03/08/23.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
