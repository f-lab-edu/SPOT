//
//  PersistanceController.swift
//
//
//  Created by 김민식 on 2024/02/23.
//

public protocol PersistanceController {
    func save<T: Encodable>(model: T, with key: String)
    func load<T: Decodable>(key: String, type: T.Type) -> T?
    func remove(with key: String)
}
