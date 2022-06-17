//
//  VolunteerIDMakerUITests.swift
//  VolunteerIDMakerUITests
//
//  Created by Paul Inventado on 2/25/22.
//

import XCTest

class VolunteerIDMakerUITests: XCTestCase {

    func testAgeTextAdded() {
        let app = XCUIApplication()
        app.launch()
        // Checks whether a Text view with the value "Age: " was added.
        XCTAssert(app.staticTexts["Age: "].exists)
    }
    
    func testAgeTextFieldAdded() {
        let app = XCUIApplication()
        app.launch()
        // Checks whether a TextField view with the name "Age" was added.
        XCTAssert(app.textFields["Age"].exists)
    }
    
    func testAddAgeChangesId() {
        let app = XCUIApplication()
        app.launch()
        // Checks whether changing the age updates the age value in the ID
        XCTAssertFalse(app.staticTexts["247"].exists)
        app.textFields["Age"].tap()
        app.textFields["Age"].typeText("247")
        XCTAssert(app.staticTexts["247"].exists)
    }
    
    func testChangedFrameSize() {
        let app = XCUIApplication()
        app.launch()
        // Checks whether the height of the enclosing VStack was changed to half of the screen height.
        XCTAssertGreaterThan(app.staticTexts["SafeWalk Volunteer"].frame.origin.y, 60)
    }
}
