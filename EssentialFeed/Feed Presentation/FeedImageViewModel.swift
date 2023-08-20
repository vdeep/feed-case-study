//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Vishal on 27/07/23.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        return location != nil
    }
}
