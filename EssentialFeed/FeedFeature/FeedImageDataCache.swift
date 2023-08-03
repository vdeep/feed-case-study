//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Vishal on 03/08/23.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}