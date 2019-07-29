//
//  UserData.swift
//  Landmarks
//
//  Created by Zahedul Alam on 29/7/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: BindableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    var showFavoritesOnly = false {
        willSet {
            willChange.send()
        }
    }

    var landmarks = landmarkData {
        willSet {
            willChange.send()
        }
    }
}
