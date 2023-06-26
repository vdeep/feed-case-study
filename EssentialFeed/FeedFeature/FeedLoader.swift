//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vishal on 02/05/23.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
