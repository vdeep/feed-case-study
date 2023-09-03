//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Vishal on 20/07/23.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
