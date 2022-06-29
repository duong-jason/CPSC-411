//
//  SearchAlternativeViewModel.swift
//  CarbonFoodPrint
//
//  Created by csuftitan on 6/29/22.
//

import SwiftUI

struct SearchAlternativeViewModel: View {
    @State var search: String = ""
    @State private var secondScreen: Bool = false
    @StateObject var alternative: AlternativeFinder = .init()
    @StateObject var history = SearchHistory()
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing {
                    HamburgerMenu(isShowing: $isShowing)
                }
                VStack(alignment: .center) {
                    Spacer()
                    HStack {
                        TextField("Search Alternatives", text: $search)
                            .frame(width: 200, height: 40, alignment: .center)
                            .border(.black)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    NavigationLink(destination: Navigation(), isActive: $secondScreen) { EmptyView() }
                    Button(action: {
                        self.secondScreen = true
                        alternative.find(search)
                        history.addSearchList(search)
                    }, label: {
                        Text("Find Alternatives".uppercased())
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    })
                    Spacer()
                    VStack {
                        Text("Recent Searches")
                            .font(.headline)
                        List(history.searchList, id: \.self) {
                            store in
                            Button(action: {
                                self.secondScreen = true
                                alternative.find(search)
                                history.addSearchList(search)
                            }) {
                                Text(store)
                            }
                        }
                    }
                    Spacer()
                }
                .cornerRadius(isShowing ? 20 : 10)
                .navigationBarTitle("Search Alternatives")
                .foregroundColor(.black)
                .navigationBarItems(leading: Button(action: {
                    withAnimation(.spring()){
                        isShowing.toggle()
                    }
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                }))
                .offset(x: isShowing ? 400 : 0, y: isShowing ? 44 : 0)
            }
        }
        .environmentObject(alternative)
    }
}

struct SearchAlternativeViewModel_Previews: PreviewProvider {
    static var previews: some View {
        SearchAlternativeViewModel()
    }
}
