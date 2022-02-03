//
//  CheckIn.swift
//  Reader
//
//  Created by 陳峻琦 on 3/2/2022.
//

import SwiftUI
import MapKit

struct CheckIn: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        Map(coordinateRegion: $locationManager.region)
            .edgesIgnoringSafeArea(.top)
    }
}

struct CheckIn_Previews: PreviewProvider {
    static var previews: some View {
        CheckIn()
    }
}
