import XCTest

import Controller
import Entity
import RunningDataAccess
import Usecase

final class RunningDashboardUsecaseTests: XCTestCase {
    var locationController: LocationServiceSpy!
    var activityController: ActivityServiceSpy!
    var persistanceController: PersistanceServiceSpy!
    var timerUsecase: TimerUsecaseSpy!
    var record: RunningRecord!
    var recordTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    let date = Date.now
    
    override func setUp() async throws {
        locationController = LocationServiceSpy()
        activityController = ActivityServiceSpy()
        persistanceController = PersistanceServiceSpy()
        timerUsecase = TimerUsecaseSpy()
        record = RunningRecord()
    }
    
    override func tearDown() async throws {
        locationController = nil
        activityController = nil
        persistanceController = nil
        timerUsecase = nil
        record = nil
    }
    
    func test_startRunning() {
        let sut = RunningPadUsecaseImp(locationController: locationController,
                                       activityController: activityController)
        
        sut.start(startedAt: date)
        
        XCTAssertEqual(locationController.startCallCount, 1)
        XCTAssertEqual(activityController.startCallCount, 1)
    }
    
    func test_pauseRunning() {
        let sut = RunningPadUsecaseImp(locationController: locationController,
                                       activityController: activityController)
        
        sut.pause()
        
        XCTAssertEqual(locationController.pauseCallCount, 1)
        XCTAssertEqual(activityController.stopCallCount, 1)
    }
    
    func test_resumeRunning() {
        let sut = RunningPadUsecaseImp(locationController: locationController,
                                       activityController: activityController)
        
        sut.resume(startedAt: date)
        
        XCTAssertEqual(locationController.resumeCallCount, 1)
        XCTAssertEqual(activityController.startCallCount, 1)
    }

    func test_stopRunning() {
        let sut = RunningPadUsecaseImp(locationController: locationController,
                                       activityController: activityController)
        
        sut.stop()
        
        XCTAssertEqual(locationController.stopCallCount, 1)
        XCTAssertEqual(activityController.stopCallCount, 1)
    }
    
    func test_update_location() {
        let sut = RunningDashboardUsecaseImp(locationController: locationController,
                                             activityController: activityController,
                                             persistanceController: persistanceController,
                                             record: record,
                                             timerUsecase: timerUsecase,
                                             recordTimer: recordTimer
        )
        
        locationController.location.send(
            Location(latitude: 37.514639, longitude: 127.048426)
        )
    }
}

import Combine

class RunningDashboardUsecaseSpy: RunningDashboardUsecase {
    var location = PassthroughSubject<Location, Never>.init() {
        didSet {
            
        }
    }
    
    var activity = PassthroughSubject<Activity, Never>.init() {
        didSet {
            
        }
    }
    
    var runningTime = PassthroughSubject<Int, Never>.init() {
        didSet {
            
        }
    }
}
