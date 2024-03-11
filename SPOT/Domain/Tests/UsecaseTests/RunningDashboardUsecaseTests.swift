import XCTest

import Controller
import Entity
import RunningDataAccess
import Usecase

final class RunningDashboardUsecaseTests: XCTestCase {
    let locationController = LocationServiceSpy()
    let activityController = ActivityServiceSpy()
    let persistanceController = PersistanceServiceSpy()
    let timerUsecase = TimerUsecaseSpy()
    let record = RunningRecord()
    let recordTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    lazy var collaborator = RunningPadUsecaseImp(locationController: locationController,
                                                 activityController: activityController)
    
    lazy var sut = RunningDashboardUsecaseImp(locationController: locationController,
                                         activityController: activityController,
                                         persistanceController: persistanceController,
                                         record: record,
                                         timerUsecase: timerUsecase,
                                         recordTimer: recordTimer)
    
    func test_startRunning() {
        collaborator.start(startedAt: Date.now)
    }
    
    //MARK: - Helper
//    private func makeSUT() -> RunningDashboardUsecase {
//        let locationController = LocationServiceSpy()
//        let activityController = ActivityServiceSpy()
//        let persistanceController = PersistanceServiceSpy()
//        let timerUsecase = TimerUsecaseSpy()
//        let record = RunningRecord()
//        let recordTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
//        
//        let sut = RunningDashboardUsecaseImp(locationController: locationController,
//                                             activityController: activityController,
//                                             persistanceController: persistanceController,
//                                             record: record,
//                                             timerUsecase: timerUsecase,
//                                             recordTimer: recordTimer)
//
//        return sut
//    }
}
