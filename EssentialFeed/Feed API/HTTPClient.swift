//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Vishal on 05/05/23.
//

import Foundation

public typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
