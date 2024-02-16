//
//  BeforeRnningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

import Usecase

public class BeforeRnningViewModel: ObservableObject {
    private let locationUsecase: LocationUsecase
    
    public init(locationUsecase: LocationUsecase) {
        self.locationUsecase = locationUsecase
    }
    
    func startButtonTapped() {
        locationUsecase.startRunning()
    }
}
