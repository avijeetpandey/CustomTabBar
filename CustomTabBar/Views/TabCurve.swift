//
//  TabCurve.swift
//  CustomTabBar
//
//  Created by Avijeet Pandey on 30/10/22.
//

import SwiftUI

struct TabCurve: Shape {
    
    var tabPoint: CGFloat
    
    var animatableData: CGFloat {
        get { return tabPoint}
        set { tabPoint = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let mid = tabPoint
            
            path.move(to: CGPoint(x: mid - 40, y: rect.height))
            
            let to = CGPoint(x: mid, y: rect.height - 20)
            let controlOne = CGPoint(x: mid - 15, y: rect.height)
            let controlTwo = CGPoint(x: mid - 15, y: rect.height - 20)
            
            let toOne = CGPoint(x: mid + 40, y: rect.height)
            let controlThree = CGPoint(x: mid + 15, y: rect.height - 20)
            let controlFour = CGPoint(x: mid + 15, y: rect.height)
            
            path.addCurve(to: to, control1: controlOne, control2: controlTwo)
            path.addCurve(to: toOne, control1: controlThree, control2: controlFour)
        }
    }
}


struct TabCurve_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
