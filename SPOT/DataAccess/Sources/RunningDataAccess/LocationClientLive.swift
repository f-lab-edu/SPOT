////
////  LocationClientLive.swift
////  
////
////  Created by 10004 on 1/22/24.
////
//
//import CoreLocation
//
//extension LocationClient {
//    public static var live: Self {
//        let manager = MainActorIsolated(initialValue: { CLLocationManager() })
//        
//        return Self(
//            delegate: {
//                let manager = await manager.value
//                
//                return AsyncStream { continuation in
//                    let delegate = LocationClientDelegate(continuation: continuation)
//                    manager.delegate = delegate
//                    
//                    continuation.onTermination = { [delegate] _ in
//                        _ = delegate
//                    }
//                }
//            },
//            authorizationStatus: {
//                return await manager.value.authorizationStatus
//            },
//            location: {
//                return await manager.value.location.map(Location.init(rawValue:))
//            },
//            requestLocation: {
//                await manager.value.requestLocation()
//            },
//            requestWhenInUseAuthorization: {
//                await manager.value.requestAlwaysAuthorization()
//            },
//            startUpdatingLocation: {
//                await manager.value.startUpdatingLocation()
//            }
//        )
//    }
//}
