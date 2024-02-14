//
//  ActivityDashBoardViewModel.swift
//
//
//  Created by 김민식 on 2024/02/13.
//

import Combine
import Foundation

import Usecase
import Entity

public class ActivityDashBoardViewModel: ObservableObject {
    @Published var distance = String()
    @Published var pace = String()
    @Published var calories = String()
    
    private var activityUsecase: ActivityUsecase
    private var cancellable: AnyCancellable?
    
    public init(activityUsecase: ActivityUsecase) {
        self.activityUsecase = activityUsecase
        cancellable = activityUsecase.activity
            .sink { activity in
                self.distance = String(format: "%.1f", activity.distance)
                
                let minutes = Int(activity.pace)
                let seconds = Int(activity.pace - Double(minutes) * 60)
                self.pace = String(format: "%d' %02d\"", minutes, seconds)
                
                let calories = Int(activity.calories)
                self.calories = String(calories)
            }
    }
    
    deinit {
        cancellable = nil
    }
}
