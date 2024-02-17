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
    @Published var runningTime: Int = 0
    
    private var activityUsecase: ActivityUsecase
    private var timerUsecase: TimerUsecase
    private var cancellables = Set<AnyCancellable>()
    
    public init(activityUsecase: ActivityUsecase, timerUsecase: TimerUsecase) {
        self.activityUsecase = activityUsecase
        self.timerUsecase = timerUsecase
        
        activityUsecase.activity
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
            .sink { time in
                self.runningTime = time
            }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
