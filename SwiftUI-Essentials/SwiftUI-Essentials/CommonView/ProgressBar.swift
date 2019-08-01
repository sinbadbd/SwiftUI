////
////  ProgressBar.swift
////  SwiftUI-Essentials
////
////  Created by Zahedul Alam on 31/7/19.
////  Copyright © 2019 devsloop. All rights reserved.
////
//
//import SwiftUI
//
//struct ProgressBar: View {
//    
//    @State var progessBarValue : CGFloat = 0
//
//    var body: some View {
//        VStack {
//            Text("hi")
//          //  ProgressBar(value: $progessBarValue)
////            CircularProgressBar(value: $progessBarValue)
////            CircularActivityIndicatory()
////            KnightRider()
//        }.onAppear {
//            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
//                self.progressBarValue += 0.1
//                if (self.progressBarValue >= 0.9) {
//                    timer.invalidate()
//                }
//            }
//        }    }
//}
//
//#if DEBUG
//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBar()
//    }
//}
//#endif
