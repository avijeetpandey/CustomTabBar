//
//  HomeView.swift
//  CustomTabBar
//
//  Created by Avijeet Pandey on 30/10/22.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: String = "house"
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("TabBg")
                .ignoresSafeArea()
            CustomTabBarView(selectedTab: $selectedTab)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
