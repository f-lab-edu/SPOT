//
//  SPOTUITests.swift
//  SPOTUITests
//
//  Created by 김민식 on 2024/03/06.
//

import XCTest

final class SPOTUITests: XCTestCase {
    func test_runningUIState() {
        let app = XCUIApplication(bundleIdentifier: "com.qutopia.SPOT")
        app.launch()
        
        XCTAssert(app.textViews["추후 아이데이션"].waitForExistence(timeout: 0.5))
    }
}
