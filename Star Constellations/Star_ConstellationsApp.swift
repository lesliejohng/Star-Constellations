//
//  Star_ConstellationsApp.swift
//  Star Constellations
//
//  Created by Leslie Groombridge on 12/03/2022.
//  Version 0.0.1
//  This is a test of how to put a 'white point on black backgroud'
//  as a basis for the 'starfield'
//

import SwiftUI

@main
struct Star_ConstellationsApp: App {
    // At present there is a single Scene showing the 'starfield'
    var body: some Scene {
        WindowGroup {
            // At present this scene has a single view
            ConstellationView()
        }
    }
}
