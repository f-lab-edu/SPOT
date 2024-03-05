import XCTest

import Controller
import Entity
import RunningDataAccess
import Usecase

final class RunningDashboardUsecaseTests: XCTestCase {
    let locationController = LocationServiceSpy()
    let activityController = ActivityServiceSpy()
    let persistanceController = PersistanceServiceSpy()
    lazy var sut = RunningDashboardUsecaseImp(locationController: locationController,
                                              activityController: activityController,
                                              persistanceController: persistanceController,
                                              record: <#T##RunningRecord#>,
                                              timerUsecase: <#T##TimerUsecase#>,
                                              recordTimer: <#T##Publishers.Autoconnect<Timer.TimerPublisher>#>)
}
