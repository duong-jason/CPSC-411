//
//  Shaoe.swift
//  Profile
//
//  Created by Paul Inventado on 4/14/22.
//

import Foundation
import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: 0))
        return path
    }
}

// TODO: Model 2 - Create your own custom shape
struct Trapazoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX / 4, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX * 3 / 4, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY / 2))
        path.move(to: CGPoint(x: rect.maxX / 4, y: 0))
        return path
    }
}
