//
//  Location.swift
//  Treads
//
//  Created by Ricardo Herrera Petit on 2/28/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import Foundation
import RealmSwift

class Location: Object {
    @objc dynamic public private (set) var lattitude = 0.0
    @objc dynamic public private (set) var longitude = 0.0
    
    convenience  init(lattitude: Double, longitude: Double) {
        self.init()
        self.lattitude = lattitude
        self.longitude = longitude
    }
}
