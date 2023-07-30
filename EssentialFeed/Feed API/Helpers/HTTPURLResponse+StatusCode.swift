//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Vishal on 30/07/23.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
