//
//  ActivityUsecaseImp.swift
//
//
//  Created by 김민식 on 2024/02/13.
//

import Foundation
import Combine

import Controller
import Entity

public final class ActivityUsecaseImp: ActivityUsecase {
    public let activity: AnyPublisher<Activity, Never> = PassthroughSubject.init().eraseToAnyPublisher()
    
    private let activityController: ActivityController
    
    public init(activityController: ActivityController) {
        self.activityController = activityController
    }
}

