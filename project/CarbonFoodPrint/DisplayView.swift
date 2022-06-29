//
//  display.swift
//  CarbonFoodPrint
//
//  Created by Jason Duong on 6/8/22.
//

import Foundation
import SwiftUI

struct DisplayView: View {
    @StateObject var manager = DisplayManager()

    var body: some View {
        TabView {
            DisplayList()
                .tabItem {
                    Image(systemName: "leaf.circle.fill")
                    Text("Contributions")
                }
            DisplayGraph()
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                    Text("Graph")
                }
            DisplayInfo()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("About")
                }
        }
        .environmentObject(manager)
        .accentColor(Color("EcoGreen"))
    }
}

struct DisplayList: View {
    @EnvironmentObject var manager: DisplayManager

    var body: some View {
        NavigationView {
            PageStack {
                Text("Your Impact on the World")
                    .modifier(DisplayTitle())
                List {
                    ForEach(manager.display) { resource in
                        NavigationLink(destination: Text("\(resource.percentage)%")) {
                            HStack {
                                Text(resource.description)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct DisplayInfo: View {
    var body: some View {
        GeometryReader { geometry in
            PageStack {
                Text("About")
                    .modifier(DisplayTitle())
                Text("From the scarcity of food resources to the development of homeless is a major issue in the world. Here, we demonstrate the impacts you made in helping starvation and the production of natural resources.")
                    .padding()
                    .frame(minWidth: geometry.size.width * 0.1,
                           maxWidth: geometry.size.width * 0.9)
                Image("food")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .clipShape(Circle())
            }
        }
    }
}
