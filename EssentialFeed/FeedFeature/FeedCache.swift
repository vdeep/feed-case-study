//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Vishal on 03/08/23.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
