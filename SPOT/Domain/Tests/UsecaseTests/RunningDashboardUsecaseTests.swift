import Combine
import XCTest

import CoreLocation
import CoreMotion
import Controller
import Entity
import RunningDataAccess
import Usecase

final class RunningDashboardUsecaseTests: XCTestCase {
    let locationManager = CLLocationManager()
    let pedometer = CMPedometer()
    lazy var locationController = LocationService(manager: locationManager)
    lazy var activityController = ActivityService(pedometer: pedometer)
    lazy var dashboardUsecaseImp = RunningDashboardUsecaseImp(locationController: locationController,
                                                              activityController: activityController)
}

class LocationControllerSpy: LocationController {
    var locationMessages: [((Location) -> Void)] = []
    var authorizationStatusMessages: [((AuthorizationStatus) -> Void)] = []
    var updatingLocationMessages: [((Bool) -> Void)] = []
    var locationErrorMessages: [((Error) -> Void)] = []
    
    var location: PassthroughSubject<Location, Never> {
        didSet {
            locationMessages.append(<#T##Element#>)
        }
    }
    var authorizationStatus = PassthroughSubject<AuthorizationStatus, Never>()
    var updatingLocation = PassthroughSubject<Bool, Never>()
    var locationError = PassthroughSubject<Error, Never>()
    
    func requestLocation() async {
        
    }
    
    func isAuthoized() -> Bool {
        
    }
    
    func start() {
        
    }
    
    func pause() {
        
    }
    
    func resume() {
        
    }
    
    func stop() {
        
    }
}
