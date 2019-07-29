//
//  Loader.swift
//  SwiftUI-JsonParsing
//
//  Created by Zahedul Alam on 29/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct Loader: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
                view.startAnimating()
                return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
    
    typealias UIViewType = UIActivityIndicatorView

    
}

//#if DEBUG
//struct Loader_Previews: PreviewProvider {
//    static var previews: some View {
//        Loader()
//    }
//}
//#endif
