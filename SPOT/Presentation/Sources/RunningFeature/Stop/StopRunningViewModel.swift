//
//  StopRunningViewModel.swift
//  
//
//  Created by 10004 on 3/16/24.
//

import Combine
import Foundation

import Usecase
import Entity

public final class StopRunningViewModel: ObservableObject {
    @Published var dayOfWeek: String = "월요일"
    @Published var isDaytime: Bool = false
    @Published var startedAt: String = "yyyy년 MM월 dd일 HH:mm"
    
    private let runningRecordUsecase: RunningRecordUsecase
    private let dateFormatter: DateFormatter
    private let calendar: Calendar.Type
    
    public init(runningRecordUsecase: RunningRecordUsecase, dateFormatter: DateFormatter, calendar: Calendar.Type) {
        self.runningRecordUsecase = runningRecordUsecase
        self.dateFormatter = dateFormatter
        self.calendar = calendar
        guard let record = runningRecordUsecase.loadRecord() else { return }
        
        self.dateFormatter.dateFormat = "EEEE"
        self.dayOfWeek = self.dateFormatter.string(from: record.startedAt)
        let hour = calendar.current.component(.hour, from: record.startedAt)
        self.isDaytime = hour >= 6 && hour < 18
        
        self.dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
        self.startedAt = self.dateFormatter.string(from: record.startedAt)
    }
    
    func shareButtonTapped() {}
    
    func closeButtonTapped(completion: () -> Void) {
        runningRecordUsecase.resetRecord()
        completion()
    }
}

