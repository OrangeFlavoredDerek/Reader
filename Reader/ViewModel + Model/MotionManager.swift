//
//  MotionManager.swift
//  Reader
//
//  Created by 陳峻琦 on 23/1/2022.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    let motionManager = CMMotionManager()
    
    @Published var x: CGFloat = 0
    @Published var y: CGFloat = 0
    @Published var z: CGFloat = 0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: .main) { data, _ in
            guard let tilt = data?.gravity else {
                return
            }
            self.x = tilt.x
            self.y = tilt.y
            self.z = tilt.z
        }
    }
}
