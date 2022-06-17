//
//  VolunteerIDMakerTests.swift
//  VolunteerIDMakerTests
//
//  Created by Paul Inventado on 2/25/22.
//

import XCTest
@testable import VolunteerIDMaker
import SwiftUI

class VolunteerIDMakerTests: XCTestCase {
    
    func testAddedTitleModifier() {
        let geomReader = Mirror(reflecting: ContentView().body)
        let hasTitleModifier = geomReader.description.contains("Mirror for GeometryReader<VStack<TupleView<(ModifiedContent<VStack<TupleView<(ModifiedContent")
        XCTAssert(hasTitleModifier)
    }

    func testChangedNameAddressAgeStyle() {
        let geomReader = Mirror(reflecting: ContentView().body)
        let hasUnModifiedNameAddressAge = geomReader.description.contains("HStack<TupleView<(Spacer, Text, TextField<Text>")
        XCTAssertFalse(hasUnModifiedNameAddressAge)
    }
    
    func testChangedIDDesign() {
        let binding = Binding<String>(get: { "temp"}, set: {_ in })
        let information = Mirror(reflecting: Information(name: binding, address: binding, age: binding).body)
        let hasUnModifiedIDDesign = information.description.contains("Mirror for TupleView<(Text, Text, Text)>")
        XCTAssertFalse(hasUnModifiedIDDesign)
    }
}
