//
//  BeforeRnningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

import Usecase

public class BeforeRnningViewModel: ObservableObject {
    private let dashboardUsecase: RunningDashboardUsecase
    
    public init(dashboardUsecase: RunningDashboardUsecase) {
        self.dashboardUsecase = dashboardUsecase
    }
}
