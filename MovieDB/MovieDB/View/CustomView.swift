//
//  CustomView.swift
//  MovieDB
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}

struct CricleShape : Shape {
    let progress : Float
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.maxX, y: rect.midY), radius: rect.width / 2, startAngle: .radians( 1.5 * .pi), endAngle: .init(radians: Double(2 * Float.pi * progress + 1.5 * Float.pi)), clockwise: false)
        return path
    }
}
