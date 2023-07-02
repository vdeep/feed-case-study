//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Vishal on 02/07/23.
//

import Foundation

internal final class FeedCachePolicy {
    private init() {}
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    private static let maxCacheAgeInDays: Int = 7
    
    internal static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(
            byAdding: .day,
            value: maxCacheAgeInDays,
            to: timestamp
        ) else {
            return false
        }
        return date < maxCacheAge
    }
}
