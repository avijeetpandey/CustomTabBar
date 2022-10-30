//
//  CustomTabBarView.swift
//  CustomTabBar
//
//  Created by Avijeet Pandey on 30/10/22.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: String
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(image: "house", selectedTab: $selectedTab)
            TabBarButton(image: "bookmark", selectedTab: $selectedTab)
            TabBarButton(image: "person", selectedTab: $selectedTab)
            TabBarButton(image: "message", selectedTab: $selectedTab)
        }.padding()
            .background(.white)
            .cornerRadius(30)
            .padding(.horizontal)
    }
}

struct CustomTabBarView_Provider: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        GeometryReader { geometry in
            Button(action: {}) {
                Image(systemName: image)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(Color("SelectedBg"))
                    .offset(y: selectedTab == image ? -10 : 0)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(height: 50)
    }
}
