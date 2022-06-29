//
//  Navigation.swift
//  TestApp
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI


struct Navigation: View {
    
    @EnvironmentObject var linkFinder: AlternativeFinder
    var body: some View {
        GeometryReader { geo in
            VStack{
                HStack{
                    Text("Title: \(linkFinder.searchTitle.uppercased())")
                }
                .frame(width: geo.size.width, height: geo.size.height/4, alignment: .center)
                .font(.headline)
                .background(.green)
                .foregroundColor(.white)
                HStack{
                    Text("Website Reference: \(linkFinder.firstSearchResult)")
                        .font(.headline)
                }
                .frame(width: geo.size.width, height: geo.size.width/3, alignment: .center)
                HStack{
                    Text(linkFinder.searchSnippet)
                }
                .frame(width: geo.size.width, height: geo.size.height/2, alignment: .center)
                .font(.headline)
            }
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
