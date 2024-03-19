//
//  PersistanceServiceSpy.swift
//
//
//  Created by 10004 on 3/5/24.
//

import Foundation
import Foundation

import Entity
import Usecase
import Controller

struct PersistanceServiceSpy: PersistanceController {
    func save<T>(model: T, with key: String) where T : Encodable {
        
    }
    
    func load<T>(key: String, type: T.Type) -> T? where T : Decodable {
        return nil
    }
    
    func remove(with key: String) {
        
    }
}
