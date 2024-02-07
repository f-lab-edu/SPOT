//
//  RunningLocationViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

import Usecase

class RunningLocationViewModel: ObservableObject {
    private let locationUsecase: LocationUsecase
    
    init(locationUsecase: LocationUsecase) {
        self.locationUsecase = locationUsecase
    }
    
    func startRunning() {
        
    }
}
