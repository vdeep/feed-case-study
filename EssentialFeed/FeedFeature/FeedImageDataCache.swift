//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Vishal on 03/08/23.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
