//
//  ContentView.swift
//  Star Constellations
//
//  Created by Leslie Groombridge on 12/03/2022.
//

import SwiftUI


struct ConstellationView: View {
    var constellation = "Orion"
    var starPosition:CGPoint = CGPoint(x: 100.0, y: 200.0)
    var starSize :CGSize = CGSize(width: 4, height: 4)
    
    var body: some View {
        VStack {
            HStack{
                Text("Sky Scan")
            }
            Canvas{ context, size in
                context.fill(
                    Path(CGRect(origin: .zero, size: size)), with: .color(.black))
                context.fill(
                    Path(ellipseIn: CGRect(origin: starPosition, size: starSize)),
                    with: .color(.white))
            }
            Text(constellation)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConstellationView()
    }
}
