//
//  CircleView.swift
//  MovieDB
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import SwiftUI

struct CircleView: View {
      var value : Float
      var body : some View {
        ZStack(alignment: .center){
              CricleShape(progress: 1)
                  .stroke(Color.blue, style: StrokeStyle(
                      lineWidth: 4,
                      lineCap: .butt,
                      lineJoin: .round,
                      miterLimit: 0,
                      dash: [],
                      dashPhase: 0)
              )
              CricleShape(progress: value)
                  .stroke(Color.red, style: StrokeStyle(
                      lineWidth: 4,
                      lineCap: .butt,
                      lineJoin: .round,
                      miterLimit: 0,
                      dash: [],
                      dashPhase: 0)
              )
          //    Text("\(value)")
          }
      }
}

 
