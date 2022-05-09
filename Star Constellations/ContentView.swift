//
//  ContentView.swift
//  Star Constellations
//  v 0-0-2
//
//  Created by Leslie Groombridge on 12/03/2022.
//

import SwiftUI


struct ConstellationView: View {
    /* in this test the following are fixed
    constellation name */
    // changed to @state to allow update of value
    @State private var constellation = "Orion"
    // createa a CGPoint for the 'star'
    var starPosition:CGPoint = CGPoint(x: 200.0, y: 200.0)
    /* setting the point size
    I am presently unclear whether star
    brightness should be recognised by
    reducing point size or changing
    colour or opacity. The latter approaches
    would have a greater range than size */
    var starSize :CGSize = CGSize(width: 4, height: 4)
    //added to test position of touch
    @State private var location: CGPoint = .zero
    
    //added to test touch in canvas
    private func setConstellation(_ name: String) {
        self.constellation = name
    }
    
    //added to change location after touch
    private func onChanged(value: DragGesture.Value) {
            location = value.location
        }
    
    var body: some View {
        VStack {
            HStack{
                // A temporary title for the view
                Text("Sky Scan")
            }
            Canvas{ context, size in
                context.fill(
                    /* there must be an easier way
                    to fill the whole of the
                     canvas with a background
                     colour, but ...
                     BLACK may not be the right
                     colour. I tend to feel the
                     night  sky is a VERY DARK
                     BLUE*/
                    Path(CGRect(origin: .zero, size: size)), with: .color(.black))
                context.fill(
                    /* unless I change approach
                    This will need to be
                    replaced with some kind
                    of array of star positions
                    and a routine to step
                    through the array and display
                    each star */
                    /* ALTERNATIVES
                     there are only 80ish
                     constellations. Using a
                     graphic image of each may
                     be a better approach. This
                     would also allow for rotation
                     of the image*/
                    Path(ellipseIn: CGRect(origin: starPosition, size: starSize)),
                    with: .color(.white))
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                let location: CGPoint = value.location
                self.setConstellation( "touched at \(location)")}))
            Text(self.constellation)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConstellationView()
    }
}
