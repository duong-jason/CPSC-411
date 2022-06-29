//
//  DailyContent.swift
//  CarbonFoodPrint
//
//  Created by Britney on 6/29/22.
//

import Foundation
import SwiftUI

struct DailyContent: View{
    @AppStorage ("amtOfPeople") var amtOfPeople: String = ""
    @AppStorage ("animalProducts") var animalProducts: String = ""
    @AppStorage ("carpoolToday") var carpoolToday: String = ""
    @AppStorage ("usedPublicTransporation") var usedPublicTransporation: String = ""
    @AppStorage ("carUsedToday") var carUsedToday: String = ""
    let carDisplay = ["Toyota Corolla", "Tesla Model Y", "Nissan Leaf", "Honda Civic"] //wasn't able to implement this into a view

    var body: some View
    {
        VStack
        {
            HStack{
                Text("Daily Questions")
                    .font(.custom("Palatino", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
            }
            HStack
            {
                Spacer()
                // this should be @AppStorage so it doesn't change
                Text("How many people do you live with? ")
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                TextField("", text: $amtOfPeople)
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
            }
            HStack
            {
                Spacer()
                Text("Did you consume animal-based products today? ")
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                TextField("", text: $animalProducts)
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
            }
            HStack
            {
                Spacer()
                Text("Did you carpool today? ")
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                TextField("", text: $carpoolToday)
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
            }
            HStack
            {
                Spacer()
                Text("Did you use public transportation today? ")
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                TextField("", text: $usedPublicTransporation)
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
                Spacer()
            }
            HStack
            {
                Spacer()
                Text("What type of car did you use today?  ")
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                TextField("", text: $carUsedToday)
                    .foregroundColor(.black)
                    .font(.custom("Menlo", size: 16))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
                Spacer()
            }
        }.background(Color.blue)
        
    }
}


struct DailyContent_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
    }
}

