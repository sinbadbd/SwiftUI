//
//  ContentView.swift
//  BarChart
//
//  Created by sinbad on 10/27/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ProgessShape : Shape {
    let progress : Double
    func path (in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 , startAngle: .radians(1.5 * .pi), endAngle: .init(radians: 2 * Double.pi * progress + 1.5 * Double.pi), clockwise: false)
        return path
    }
}

struct ProgressView : View {
    let progress : Double
    
    var body : some View {
        ProgessShape(progress: progress)
            .stroke(Color.blue,
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: 0,
                        dash: [],
                        dashPhase: 0)
        )
    }
}

struct Legend: Hashable {
    let color: Color
    let label: String
}

struct Bar: Identifiable {
    let id: UUID
    let value: Double
    let label: String
    let legend: Legend
}
