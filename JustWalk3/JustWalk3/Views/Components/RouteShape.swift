import SwiftUI
import CoreLocation

struct RouteShape: Shape {
    var coords: [CLLocationCoordinate2D]

    func path(in rect: CGRect) -> Path {
        guard !coords.isEmpty else { return Path() }

        let lats  = coords.map(\.latitude)
        let lons  = coords.map(\.longitude)

        let minLat = lats.min()!, maxLat = lats.max()!
        let minLon = lons.min()!, maxLon = lons.max()!

        let scaleX = rect.width  / CGFloat(maxLon - minLon + 0.0001)
        let scaleY = rect.height / CGFloat(maxLat - minLat + 0.0001)

        let points = coords.map { p in
            CGPoint(
                x: CGFloat(p.longitude - minLon) * scaleX,
                y: rect.height - (CGFloat(p.latitude - minLat) * scaleY)
            )
        }

        var path = Path()
        path.move(to: points.first!)
        for pt in points.dropFirst() { path.addLine(to: pt) }
        return path
    }
}

