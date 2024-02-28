//
//  UserDefaultsService.swift
//
//
//  Created by 김민식 on 2024/02/23.
//

import Foundation

import Controller
import Entity

public final class UserDefaultsService: PersistanceController {
    private let userdefaults: UserDefaults
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    public init(userdefaults: UserDefaults, decoder: JSONDecoder, encoder: JSONEncoder) {
        self.userdefaults = userdefaults
        self.decoder = decoder
        self.encoder = encoder
    }
    
    public func save<T: Encodable>(model: T, with key: String) {
        let data = try? encoder.encode(model)
        userdefaults.setValue(data, forKeyPath: key)
    }
    
    public func load<T: Decodable>(key: String) -> T? {
        guard let data = userdefaults.data(forKey: key) else {
            return nil
        }
        
        let model = try? decoder.decode(T.self, from: data)
        return model
    }
    
    public func remove(with key: String) {
        userdefaults.removeObject(forKey: key)
    }
}
