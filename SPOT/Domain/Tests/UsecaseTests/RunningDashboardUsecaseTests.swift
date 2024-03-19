import XCTest
import Combine

import Controller
import Entity
import Usecase

final class RunningDashboardUsecaseTests: XCTestCase {
    var locationController: LocationServiceSpy!
    var activityController: ActivityServiceSpy!
    var persistanceController: PersistanceServiceSpy!
    var timerUsecase: TimerUsecaseSpy!
    var record: RunningRecord!
    var recordTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
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
        //given
        let sut = RunningDashboardUsecaseImp(locationController: locationController,
                                             activityController: activityController,
                                             persistanceController: persistanceController,
                                             record: record,
                                             timerUsecase: timerUsecase,
                                             recordTimer: recordTimer)
        
        let location = Location(latitude: 37.514639, longitude: 127.048426)
        let activity = Activity(distance: 2.0, pace: 2.0, calories: 2.0)
        let time = 20
        var cancellables = Set<AnyCancellable>.init()
        
        var newLocation = Location(latitude: 0, longitude: 0)
        var newActivity = Activity(distance: 0, pace: 0, calories: 0)
        var newTime = 0
        
        sut.location.sink { newLocation = $0 }
            .store(in: &cancellables)
        sut.activity.sink { newActivity = $0 }
            .store(in: &cancellables)
        sut.runningTime.sink { newTime = $0 }
            .store(in: &cancellables)
        
        //when
        sut.start(startedAt: date)
        
        locationController.location.send(location)
        activityController.activity.send(activity)
        timerUsecase.runningTime.send(time)
        
        //then
        XCTAssertEqual(location, newLocation)
        XCTAssertEqual(activity, newActivity)
        XCTAssertEqual(time, newTime)
    }
    
    func test_save_record() {
        //given
        let sut = RunningDashboardUsecaseImp(locationController: locationController,
                                             activityController: activityController,
                                             persistanceController: persistanceController,
                                             record: record,
                                             timerUsecase: timerUsecase,
                                             recordTimer: recordTimer)
        
        let location1 = Location(latitude: 37.514639, longitude: 127.048426)
        let location2 = Location(latitude: 37.514639, longitude: 127.048428)
        let activity = Activity(distance: 2.0, pace: 2.0, calories: 2.0)
        let time = 20
        let record = RunningRecord(
            locations: [location1, location2],
            activity: activity,
            time: time)
        
        //when
        sut.start(startedAt: date)
        
        locationController.location.send(location1)
        locationController.location.send(location2)
        activityController.activity.send(activity)
        timerUsecase.runningTime.send(time)
        
        //then
        guard let loadedRecord = sut.loadRecord() else { return }
        XCTAssertNotNil(loadedRecord)
        XCTAssertEqual(loadedRecord, record)
    }
}
