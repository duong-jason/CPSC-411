//
//  ProfileTests.swift
//  ProfileTests
//
//  Created by Paul Inventado on 4/14/22.
//

@testable import Profile
import XCTest

class ProfileTests: XCTestCase {
    func testAddShape() throws {
        let content = Mirror(reflecting: ContentView().body)
        let hasNoAddedShape = content.description.contains("<HStack<TupleView<(ModifiedContent<_ShapeView<Diamond, Color>")
        // Checks if a Shape was added before Diamond()
        XCTAssertFalse(hasNoAddedShape)
    }

    func testAddCustomShape() throws {
        let content = Mirror(reflecting: ContentView().body)
        // print(content.description)
        let hasNoCustomShape = content.description.contains("ModifiedContent<_ShapeView<Diamond, Color>, _FrameLayout>)>>")
        // Checks if a Custom Shape was added after Diamond()
        XCTAssertFalse(hasNoCustomShape)
    }

    func testModifyImage() throws {
        let content = Mirror(reflecting: ContentView().body)

        print(content.description)
        let modifiedImage = content.description.contains("ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _FrameLayout>, _ClipEffect<Circle>>, _OverlayModifier<ModifiedContent<_StrokedShape<Circle>, _EnvironmentKeyWritingModifier<Optional<Color>>>>>, _ShadowEffect>")
        // Checks if a Custom Shape was added after Diamond()
        XCTAssert(modifiedImage)
    }
}
