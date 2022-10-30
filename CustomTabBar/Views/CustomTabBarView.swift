//
//  CustomTabBarView.swift
//  CustomTabBar
//
//  Created by Avijeet Pandey on 30/10/22.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: String
    @State var tabPoints: [CGFloat] = []
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(image: "house", tabPoints: $tabPoints, selectedTab: $selectedTab)
            TabBarButton(image: "bookmark", tabPoints: $tabPoints, selectedTab: $selectedTab)
            TabBarButton(image: "message", tabPoints: $tabPoints, selectedTab: $selectedTab)
            TabBarButton(image: "person", tabPoints: $tabPoints, selectedTab: $selectedTab)
        }.padding()
            .background(Color.white.clipShape(TabCurve(tabPoint: getCurvePoint() - 15)))
            .overlay(alignment: .bottomLeading ,content: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 10, height: 10)
                    .offset(x: getCurvePoint() - 20)
            })
            .cornerRadius(30)
            .padding(.horizontal)
    }
    
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
                case "house":
                    return tabPoints[0]
                case "bookmark":
                    return tabPoints[1]
                case "message":
                    return tabPoints[2]
                default:
                    return tabPoints[3]
            }
        }
    }
}

struct CustomTabBarView_Provider: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct TabBarButton: View {
    var image: String
    @Binding var tabPoints: [CGFloat]
    @Binding var selectedTab: String
    var body: some View {
        GeometryReader { reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            
            return AnyView (
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6,
                                                     dampingFraction: 0.5,
                                                     blendDuration: 0.5)) {
                        selectedTab = image
                    }
                }) {
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("SelectedBg"))
                        .offset(y: selectedTab == image ? -10 : 0)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }.frame(height: 50)
    }
}
