//
//  Volunteer.swift
//  VolunteerHours
//
//  Created by Paul Inventado on 3/3/22.
//

import Foundation

class Volunteer: ObservableObject, Identifiable {
    @Published var name: String
    @Published var age: Int
    
    var maxHours: Int {
        switch age {
            case 13...17: return 4
            case 18...50: return 6
            case 51...60: return 3
            default: return 0
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// TODO: (Model 4) Copy VolunteerManager here
