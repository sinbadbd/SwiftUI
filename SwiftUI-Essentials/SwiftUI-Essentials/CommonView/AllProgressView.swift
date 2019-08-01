//
//  AllProgressView.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 31/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct AllProgressView: View {
    
    @State var progressBarValue:CGFloat = 0

    var body: some View {
        VStack{
            CircleProgressBar(value: $progressBarValue)
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                self.progressBarValue += 0.1
                if (self.progressBarValue >= 0.9) {
                    timer.invalidate()
                }
            }
        }    }
}

#if DEBUG
struct AllProgressView_Previews: PreviewProvider {
    static var previews: some View {
        AllProgressView()
    }
}
#endif
