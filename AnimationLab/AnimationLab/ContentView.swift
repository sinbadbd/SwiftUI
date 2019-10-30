//
//  ContentView.swift
//  AnimationLab
//
//  Created by Imran on 29/10/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello World")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
struct PercentageIndicator: AnimatableModifier {
    var pct: CGFloat = 0
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(ArcShape(pct: pct).foregroundColor(.red))
            .overlay(ContentView(pct: pct))
    }
    
    struct ArcShape: Shape {
        let pct: CGFloat
        
        func path(in rect: CGRect) -> Path {

            var p = Path()

            p.addArc(center: CGPoint(x: rect.width / 2.0, y:rect.height / 2.0),
                     radius: rect.height / 2.0 + 5.0,
                     startAngle: .degrees(0),
                     endAngle: .degrees(360.0 * Double(pct)), clockwise: false)

            return p.strokedPath(.init(lineWidth: 10, dash: [6, 3], dashPhase: 10))
        }
    }
    

}
struct ContentView: View {
    let pct: CGFloat
    
    var body: some View {
        Text("\(Int(pct * 100)) %")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}
