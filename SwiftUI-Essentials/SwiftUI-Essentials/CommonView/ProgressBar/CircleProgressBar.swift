//
//  CircleProgressBar.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 31/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//
//https://github.com/gualtierofrigerio/SwiftUIProgressBar
import SwiftUI

struct CircleProgressBar: View {
    @Binding var value:CGFloat
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: value)
                .stroke(Color.green, lineWidth:10)
                .frame(width:100)
                .rotationEffect(Angle(degrees:-90))
            Text(getPercentage(value))
        }
    }
    
    func getPercentage(_ value:CGFloat) -> String {
        let intValue = Int(ceil(value * 100))
        return "\(intValue)"
    }
}

//#if DEBUG
//struct CircleProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleProgressBar()
//    }
//}
//#endif
