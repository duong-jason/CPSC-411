//
//  DisplayModifier.swift
//  CarbonFoodPrint
//
//  Created by Jason Duong on 6/26/22.
//

import Foundation
import SwiftUI

struct DisplayTitle: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.custom("Menlo", size: 22))
                .foregroundColor(Color("EcoGreen"))
                .padding()
                .cornerRadius(10)
                .frame(alignment: .topLeading)
            Divider()
        }
    }
}

struct PageStack<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack {
            content()
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}