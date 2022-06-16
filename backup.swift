#!/usr/bin/swift

//
//  display.swift
//  CarbonFoodPrint
//
//  Created by Jason Duong on 6/8/22.
//

import Foundation
import SwiftUI

enum Impact {
    case Carbon
    case Water
    case Soil
    case Antibiotics
}

class Display {
    // contains the impact and the percentage with respect to their order ingredients
    var factor = [Impact: UInt]()
    
    init(factor: [Impact: UInt]) {
        self.factor = factor
    }
    
}

struct DisplayView: View {
    var display = Display(factor: [
        .Carbon: 5,
        .Water: 40,
        .Soil: 30,
        .Antibiotics: 25
    ])
    @State var percentage: [UInt] = [5, 40, 30, 25]

    var body: some View {
        GeometryReader { geometry in
            VStack() {
               Text("Your Impact on the World")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.brown)
                ImpactView(text: "Carbon Emissions Reduced", percentage: $percentage[0])
                ImpactView(text: "Water Saved", percentage: $percentage[1])
                ImpactView(text: "Soil Quality Improved", percentage: $percentage[2])
                ImpactView(text: "Antibiotics Mitigated", percentage: $percentage[3])
            }.frame(height: geometry.size.height / 3)
        }
    }
}

struct ImpactView: View {
    var text: String
    @Binding var percentage: UInt
    
    var body: some View {
        HStack {
            Button(action: {
                print("Impact: \(percentage)")
            }) {
                Text(text)
            }
        }
    }
}

