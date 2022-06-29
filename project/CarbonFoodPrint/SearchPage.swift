//
//  SearchPage.swift
//  CarbonFoodPrint
//
//  Created by csuftitan on 6/20/22.
//

import SwiftUI

struct SearchPage: View {
    @State var expand = false
    @State var searchs: [String] = ["Search Result 1", "Search Result 2", "Search Result 3", "Search Result 4", "Search Result 5"]
    var body: some View{
        NavigationView {
            List{
                Section(){
                    ForEach(searchs, id:\.self){
                        searchs in DisclosureGroup(searchs, isExpanded: $expand){
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50, alignment: .center)
                                
                            Text("Search Result Description")
                        }
                    }
                }
            }
            .navigationTitle("Search Results")
            
        }
    }
}


struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
    }
}
