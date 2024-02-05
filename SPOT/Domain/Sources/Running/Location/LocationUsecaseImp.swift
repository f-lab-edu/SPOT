//
//  File.swift
//  
//
//  Created by Soojin Ro on 2/4/24.
//

import Foundation
import Combine

public final class LocationUsecaseImp: LocationUsecase {
  public let location: AnyPublisher<Location, Never> = PassthroughSubject.init().eraseToAnyPublisher()
  
  
  public func saveLastUserLocation() {
    self.controller.delegate()//.sink {
      // send to stream
      
    self.databaseController.save(lastLocation)
    //}
    
    
  }
  
  
  private let locationController: LocationRepository
  private let databaseController: DatabaseController
  FileController
  
  init(controller: LocationController) {
    self.controller = controller
  }
}
