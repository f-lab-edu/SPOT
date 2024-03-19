//
//  RunningRecordUsecase.swift
//
//
//  Created by 10004 on 3/16/24.
//

import Entity

public protocol RunningRecordUsecase {
    func resetRecord()
    func loadRecord() -> RunningRecord?
}
