//
//  MainView.swift
//  CarbonFoodPrint
//
//  Created by Britney  on 6/27/22.
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            DailyContent()
                .tabItem{
                    Image(systemName: "info")
                    Text("Daily Inquires")
                }
            DailyReport()
                .tabItem {
                    Label("Daily Results", systemImage: "list.dash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
