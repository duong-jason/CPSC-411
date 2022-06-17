//
//  ContentView.swift
//  VolunteerIDMaker
//
//  Created by Paul Inventado on 2/25/22.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var address: String = ""
    @State var age: String = ""

    var body: some View {
        // TODO: Enclose this entire VStack with GeometryReader in Model 3
        GeometryReader { geometry in
            VStack {
                // TODO: Add frame method call to this VStack in Model 3
                VStack {
                    Text("SafeWalk Volunteer")
                        .modifier(TitleText())
                    HStack {
                        Spacer()
                        Text("Name: ")
                            .modifier(SafeWalkText())
                        TextField("Name", text: $name)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Address: ")
                            .modifier(SafeWalkText())
                        TextField("Address", text: $address)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Age: ")
                            .modifier(SafeWalkText())
                        TextField("Age", text: $age)
                        Spacer()
                    }
                }.frame(height: geometry.size.height / 2)
                Spacer()
                /* TODO: Replace the entire Text VStack below with sub view provided in Model 2
                 */
                VStack {
                    Information(name: $name, address: $address, age: $age)
                }.frame(height: geometry.size.height / 2)
            }
        }
    }
}

// TODO: Add Information structure provided in Model 2
struct Information: View {
    @Binding var name: String
    @Binding var address: String
    @Binding var age: String

    var body: some View {
        Text("ID Sample")
            .modifier(TitleText())
            .frame(width: 400)
        ZStack {
            Rectangle()
                .fill(.yellow)
                .cornerRadius(10)
                .frame(width: 250, height: 150)
            VStack {
                Text("SafeWalk Volunteer | California)")
                    .bold()
                    .font(.system(size: 14))
                HStack {
                    Text("😁")
                        .font(.system(size: 100))
                        .padding(.leading, -50)
                    VStack(spacing: 0) {
                        Text(name)
                            .bold()
                            .font(.system(size: 14))
                        Text(address)
                            .font(.system(size: 12))
                        Text("Age: \(age)")
                    }.frame(width: 60, alignment: .leading)
                }
            }
        }

        Text(name)
        Text(address)
        Text(age)
    }
}

// TODO: Add custom modifier below then use it to customizes your views for Model 5
struct SafeWalkText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Al Bayan Bold", size: 14))
            .padding(.leading, 10)
            .foregroundColor(Color.pink)
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Courier New", size: 30))
            .foregroundColor(Color.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
