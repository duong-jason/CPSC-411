//
//  EditableCrosswalkListUITests.swift
//  EditableCrosswalkListUITests
//
//  Created by Paul Inventado on 3/31/22.
//

import XCTest

class EditableCrosswalkListUITests: XCTestCase {
    func testAddNewCrossWalk() {
        let app = XCUIApplication()
        app.launch()
        print(app.tables.element.cells.count)
        // Checks if a new element was added to the CrosswalkManager
        XCTAssertGreaterThan(app.tables.element.cells.count, 3)
    }
    
    func testDelete() {
        let app = XCUIApplication()
        app.launch()
        
        let cell = app.tables.element.cells["Titan hall, 800 N State College Blvd., Fullerton CA 92831"]
        XCTAssert(cell.exists)
        cell.swipeLeft()
        cell.buttons["Delete"].tap()
        XCTAssertFalse(app.tables.element.cells["Titan hall, 800 N State College Blvd., Fullerton CA 92831"].exists)
    }
    
    func testMove() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Edit"].tap()
        
        let movedCell = app.tables.element.cells["ECS building, Campus Dr. Fullerton, CA 92831"]
        XCTAssert(movedCell.buttons["Reorder"].exists)

        let targetCell = app.tables.element.cells["Titan hall, 800 N State College Blvd., Fullerton CA 92831"].coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        
        movedCell.buttons["Reorder"].coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).press(forDuration: 0, thenDragTo: targetCell)
        XCTAssertEqual(app.tables.element.cells.element(boundBy: 0).label, "ECS building, Campus Dr. Fullerton, CA 92831")
        
        app.buttons["Done"].tap()
    }
    
    func testTabAdded() {
        let app = XCUIApplication()
        app.launch()
        
        // Checks if a new tab bar was created
        XCTAssertEqual(app.tabBars.buttons.count, 3)
    }
    
    func testAddCrossWalk() {
        let app = XCUIApplication()
        app.launch()
    
        app.tabBars.buttons["Add Crosswalk"].tap()
        
        app.textFields["Crosswalk name"].tap()
        app.textFields["Crosswalk name"].typeText("Gastronome")
        app.keyboards.buttons["return"].tap()
        
        let textArea = app.textViews.element(boundBy: 0)
        textArea.tap()
        textArea.typeText("Gymnasium Drive, Fullerton CA 92831")
        app.textFields["Crosswalk name"].tap()
        app.keyboards.buttons["return"].tap()
        
        app.buttons["Submit"].tap()
        
        app.tabBars.buttons["Crosswalks"].tap()
        let cell = app.tables.element.cells["Gastronome, Gymnasium Drive, Fullerton CA 92831"]
        XCTAssert(cell.exists)
    }
}
