//
//  ImageCommentsMapper.swift
//  EssentialFeed
//
//  Created by Vishal on 13/08/23.
//

import Foundation

public final class ImageCommentsMapper {
    private struct Root: Decodable {
        private let items: [Item]

        private struct Item: Decodable {
            let id: UUID
            let message: String
            let createdAt: Date
            let author: Author

            private enum CodingKeys: String, CodingKey {
                case id, message, author
                case createdAt = "created_at"
            }
        }

        private struct Author: Decodable {
            let username: String
        }

        var comments: [ImageComment] {
            items.map {
                ImageComment(
                    id: $0.id,
                    message: $0.message,
                    createdAt: $0.createdAt,
                    username: $0.author.username
                )
            }
        }
    }

    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [ImageComment] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        guard
            isOK(response), let root = try? decoder.decode(Root.self, from: data)
        else {
            throw Error.invalidData
        }
        
        return root.comments
    }
    
    private static func isOK(_ response: HTTPURLResponse) -> Bool {
        (200...299).contains(response.statusCode)
    }
}
