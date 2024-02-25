//
//  DashBoardViewModel.swift
//
//
//  Created by 김민식 on 2024/02/13.
//

import Combine
import Foundation

import Usecase
import Entity

public class DashboardViewModel: ObservableObject {
    @Published var distance = "0.0"
    @Published var pace = "0'0"
    @Published var calories = "0"
    @Published var runningTime = "00:00:00"
    
    private var dashboardUsecase: RunningDashboardUsecase
    private var timerUsecase: TimerUsecase
    private var cancellables = Set<AnyCancellable>()
    private let timeFormat = "%02d:%02d:%02d"
    
    public init(dashboardUsecase: RunningDashboardUsecase, timerUsecase: TimerUsecase) {
        self.dashboardUsecase = dashboardUsecase
        self.timerUsecase = timerUsecase
        
        dashboardUsecase.activity
            .sink { activity in
                self.distance = String(format: "%.1f", activity.distance)
                let minutes = Int(activity.pace)
                let seconds = Int(activity.pace - Double(minutes) * 60)
                self.pace = String(format: "%d' %02d\"", minutes, seconds)
                
                let calories = Int(activity.calories)
                self.calories = String(calories)
            }
            .store(in: &cancellables)
        
        timerUsecase.runningTime
            .sink { seconds in
                let hours = seconds / 3600
                let minutes = (seconds % 3600) / 60
                let seconds = (seconds % 3600) % 60
                
                let time = String(format: self.timeFormat, hours, minutes, seconds)
                self.runningTime = time
            }
            .store(in: &cancellables)
    }
}
