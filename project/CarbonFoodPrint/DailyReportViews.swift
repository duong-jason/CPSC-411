//
//  DailyReportViews.swift
//  CarbonFoodPrint
//
//  Created by Britney  on 6/27/22.
//

import Foundation
import SwiftUI

struct DailyReport: View {
    let userData = DailyContent()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Daily Results")
                        .font(.custom("Palatino", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding())
                    {
                        NavigationLink(destination: Text("You live with \(userData.amtOfPeople) people")
                            .background(Color.cyan)) {
                            Text("How many people do you live with? ")
                                .font(.custom("Palatino", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        NavigationLink(destination: Text("Consumed Animal-based Products Today: \(userData.animalProducts)")) {
                            Text("Did you consume animal-based products today? ")
                                .font(.custom("Palatino", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        NavigationLink(destination: Text("Carpool Today: \(userData.carpoolToday)")) {
                            Text("Did you carpool today? ")
                                .font(.custom("Palatino", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        NavigationLink(destination: Text("Public Transporation Used Today: \(userData.usedPublicTransporation)")) {
                            Text("Did you use public transportation today? ")
                                .font(.custom("Palatino", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        NavigationLink(destination: Text("Car Used Today: \(userData.carUsedToday)")) {
                            Text("What type of car did you use today? ")
                                .font(.custom("Palatino", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }.background(Color.blue)
                }
            }
        }
    }
}
