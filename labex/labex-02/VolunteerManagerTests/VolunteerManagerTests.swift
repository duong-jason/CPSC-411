//
//  VolunteerManagerTests.swift
//  VolunteerManagerTests
//
//  Created by Paul Inventado on 2/23/22.
//

import XCTest
@testable import VolunteerManager

class VolunteerManagerTests: XCTestCase {

    // Sample unit test
    func testAddValidNewVolunteer() {
        // Create Volunteer manager and add a volunteer with valid hours
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 5)
        
        // Successfully adding a volunteer should change the volunteers dictionary.
        // Therefore we check whether we can find Paul with 5 hours assigned.
        XCTAssertEqual(manager.volunteers["Paul"], 5)
    }
    
    func testAddValidNegativeHours() {
        // Tests if adding a new volunteer with hours less than zero is not added
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: -1)
            
        // Check if Paul is not in the dictionary
        XCTAssertNil(manager.volunteers["Rick"])
    }
    
    func testAddValidExceedHours() {
        // Tests if adding a new volunteeer with over 20 hours is accurate
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 30)
        
        // Tests if the Paul's accumulated hours is 20
        XCTAssertEqual(manager.volunteers["Paul"], 20)
    }

    func testAddExistingHours() {
        // Tests if adding an existing volunteer's hours less than 20 is accurate
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 5)
        manager.volunteer("Paul", for: 10)
        
        // Tests if the John's accumulated hours is 5 + 10 = 15
        XCTAssertEqual(manager.volunteers["Paul"], 15)
    }
    
    func testAddExistingExceedHours() {
        // Tests if adding an existing volunteer's hours exceeding 20 is accurate
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 15)
        manager.volunteer("Paul", for: 10)
        
        // Tests if the Paul's accumulated hours is 20
        XCTAssertEqual(manager.volunteers["Paul"], 20)
    }
}
