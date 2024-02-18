//
//  RunningAuthorizationUsecase.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Foundation

public protocol RunningAuthorizationUsecase {
    func locationIsAuthorize() -> Bool
    func activityIsAuthorize() -> Bool
}
