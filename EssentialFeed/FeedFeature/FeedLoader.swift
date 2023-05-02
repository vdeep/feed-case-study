//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vishal on 02/05/23.
//

import Foundation

typealias LoadFeedResult = Result<[FeedItem], Error>

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
