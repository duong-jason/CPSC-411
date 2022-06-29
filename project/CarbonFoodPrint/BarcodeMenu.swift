//
//  ARBAR.swift
//  CarbonFoodPrint
//
//  Created by Jonathan Story on 6/27/22.
//

import Foundation
import SwiftUI

/*
struct ARView: View {
    var body: some View {
        
        //Text("Camera goes here")
        NavigationView {
            VStack {
                Text("AR camera goes here")
                /*
                List {
                    Section(header: Text("Camera goes here")) {
                        NavigationLink(destination: Text("Name of the crosswalk")) {
                            Text("Crosswalk name")
                        }
                        NavigationLink(destination: Text("Address of the crosswalk")) {
                            Text("Crosswalk address")
                        }
                    }
                
                    
                    }
                */
                }
                Spacer()
            }
        }
    }
 */
struct BarView: View {
    @Binding var TheVar: String
    @Binding var TheList: String
    //@State var TheChoice: Int
    @Binding var cost: Int
    var body: some View {

        NavigationView {
            VStack {
                //Text("Barcode scanner goes here")
                
                //NavigationLink(destination: ListInfo(TheList: $TheList)) {
                NavigationLink(destination: AppleViewer(cost: $cost)) {
                    Text("Scan Apple").bold().modifier(ButtonDesign())
                                             .font(.caption)
                                }//.padding(.bottom, 30)
                NavigationLink(destination: BananaViewer(cost: $cost)) {
                    Text("Scan Banana").bold().modifier(ButtonDesign())
                                             .font(.caption)
                                }//.padding(.bottom, 30)
                NavigationLink(destination: OrangeViewer(cost: $cost)) {
                    Text("Scan Orange").bold().modifier(ButtonDesign())
                                             .font(.caption)
                                }//.padding(.bottom, 30)
                //NavigationLink(destination: TotalListViewer()) {
                   // Text("See total list of items").bold().modifier(ButtonDesign())
                     //                        .font(.caption)
                       //         }//.padding(.bottom, 30)
                
                /*
                NavigationLink(destination: ListViewer(TheList: $TheList)) {
                    Text("Scan Orange").bold().modifier(ButtonDesign())
                                             .font(.caption)
                                }//.padding(.bottom, 30)
                 */
                /*
                Button(action: {
                    print("Was clicked")
                }) {
                    Text("Scan Banana").bold()
                }.padding().modifier(ContentText())   //.border(Color.black)
                Button(action: {
                    print("Was clicked")
                }) {
                    Text("Scan Apple")
                }.padding().modifier(ContentText())   //.border(Color.black)
                */
                NavigationLink(destination: VolunteerDetails(TheVar: $TheVar)) {
                    Text("See Notices")
                                             .font(.caption)
                                }//.padding(.bottom, 30)
                
                /*
                List {
                    Section(header: Text("Scanner goes here")) {
                        NavigationLink(destination: Text("Name of the crosswalk")) {
                            Text("Crosswalk name")
                        }
                        NavigationLink(destination: Text("Address of the crosswalk")) {
                            Text("Crosswalk address")
                        }
                    }
                
                    
                    }
                 */
                }
                Spacer()
            }
        }
    }

struct TotalListViewer: View {
    //@Binding var TheList: String
    @EnvironmentObject var man: ProductManager
    //@State var TheChoice: Int
    @Binding var cost: Int
    var body: some View {
        VStack {
        
            Text("List of Items")
                .font(.headline)
                .padding(.bottom, 30)
            
            HStack {
                List {
                ForEach(man.products) {
                    product in
                    VStack (alignment: .leading) {
                        Text(product.name)
                            .font(.largeTitle)
                        Text(product.description)
                            .font(.caption)
                    }
                }.onDelete {
                    offset in
                    man.products.remove(atOffsets: offset)
                }
            }
            
        }
            Spacer()
            Text("The total cost is: $\(cost) dollars.")
            Spacer()
            Text("There are currently \(man.products.count) items in the list.")
                            .padding(.bottom, 10)
    }
}
}

struct RoundedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(10)
    }
}

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(RoundedBackground())
            .foregroundColor(Color.white)
    }
}

