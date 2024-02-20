//
//  Runner.swift
//
//
//  Created by 김민식 on 2024/02/20.
//

import Foundation

public struct Runner {
    public let name: String
    public let thumbnailURL: URL
    
    public init(name: String, thumbnailURL: URL) {
        self.name = name
        self.thumbnailURL = thumbnailURL
    }
}
