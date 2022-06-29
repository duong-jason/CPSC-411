//
//  HamburgerMenu.swift
//  CarbonFoodPrint
//
//  Created by csuftitan on 6/13/22.
//

import SwiftUI

struct HamburgerMenu: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue,Color.green]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                SideMenu(isShowing: $isShowing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationBarHidden(true)
    }
}

struct HamburgerMenu_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenu(isShowing: .constant(true))
    }
}
