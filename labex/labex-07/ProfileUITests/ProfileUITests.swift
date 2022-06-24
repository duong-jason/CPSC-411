//
//  ProfileUITests.swift
//  ProfileUITests
//
//  Created by Paul Inventado on 4/14/22.
//

import XCTest

class ProfileUITests: XCTestCase {
    func testAddNewImage() throws {
        let app = XCUIApplication()
        app.launch()
        // Checks if new image was added
        XCTAssertGreaterThan(app.images.count, 1)
    }
}
