//
//  SideMenu.swift
//  TestApp
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {withAnimation(.spring()){
                isShowing.toggle()
            }}, label: {
                Image(systemName: "chevron.backward")
                    .frame(width:32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })
            VStack(alignment: .leading){
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width:64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom,16)
                Text("Vamsikrishna Madabhushi")
                    .font(.system(size:24, weight: .semibold))
                HStack{
                    Image(systemName: "person")
                        .frame(width: 24, height: 24)
                    Text("Profile")
                        .font(.system(size:20,weight: .semibold))
                    Spacer()
                }
                HStack{
                    Image(systemName: "house.fill")
                        .frame(width: 24, height: 24)
                    Text("Home")
                        .font(.system(size:20,weight: .semibold))
                    Spacer()
                }
                HStack{
                    Image(systemName: "mail.and.text.magnifyingglass")
                        .frame(width: 24, height: 24)
                    Text("Search Alternatives")
                        .font(.system(size:20,weight: .semibold))
                    Spacer()
                }
                HStack{
                    Image(systemName: "barcode.viewfinder")
                        .frame(width: 24, height: 24)
                    Text("AR and Barcode")
                        .font(.system(size:20,weight: .semibold))
                    Spacer()
                }
                HStack{
                    Image(systemName: "map.circle.fill")
                        .frame(width: 24, height: 24)
                    Text("Maps")
                        .font(.system(size:20,weight: .semibold))
                    Spacer()
                }
                HStack{
                    Image(systemName: "exclamationmark.bubble.fill")
                        .frame(width: 24, height: 24)
                    Text("Reports")
                        .font(.system(size:20,weight: .semibold))
                    Spacer()
                }
                HStack{
                    Image(systemName: "network.badge.shield.half.filled")
                        .frame(width: 24, height: 24)
                    Text("Impact and Statistics")
                        .font(.system(size:20,weight: .semibold))
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(isShowing: .constant(true))
    }
}
