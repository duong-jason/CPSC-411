//
//  ContentView.swift
//  TestApp
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        TabView{
            DisplayView()
                .tabItem{
                    Image(systemName: "network.badge.shield.half.filled")
                    Text("Statistics and Impact")
                }
            SearchAlternativeViewModel()
                .tabItem{
                    Image(systemName: "mail.and.text.magnifyingglass")
                    Text("Check Alternatives")
                }.padding(.bottom, 30)
            BarcodeFeature()
                .tabItem {
                    Image(systemName: "camera")
                    Text("Barcode Scanner ")
                }.padding(.bottom, 30)
            DailyContent()
                .tabItem{
                    Image(systemName: "info")
                    Text("Daily Inquires")
                }
            DailyReport()
                .tabItem {
                    Label("Daily Results", systemImage: "list.dash")
                }
        }//.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
