//
//  LocationUsecase.swift
//
//
//  Created by 10004 on 1/22/24.
//
import Combine

public protocol LocationUsecase {
//    func delegate()
//    func start()
//    func pause()
//    func stop()
  var location: AnyPublisher<Location, Never> { get }
}

public struct Location {
  let longtitude: Double
  let latitude: Double
}
