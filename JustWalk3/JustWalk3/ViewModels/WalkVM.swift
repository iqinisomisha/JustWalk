import Combine
import CoreLocation
import SwiftUI

@MainActor
final class WalkVM: NSObject, ObservableObject {
    enum State { case idle, walking, library }
    @Published var state: State = .idle
    @Published var dist: Double = 0
    @Published var elapsed: TimeInterval = 0
    @Published var points: [CLLocationCoordinate2D] = []
    @Published var walks: [[CLLocationCoordinate2D]] = []

    private let loc = CLLocationManager()
    private var bag = Set<AnyCancellable>()
    private var startTime: Date?
    private var last: CLLocation?

    override init() {
        super.init()
        loc.delegate = self
    }

    func start() {
        loc.requestWhenInUseAuthorization()
        loc.activityType = .fitness
        loc.allowsBackgroundLocationUpdates = true
        loc.startUpdatingLocation()
        startTime = .now
        dist = 0; points = []; last = nil
        state = .walking
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                if let s = self?.startTime {
                    self?.elapsed = .now.timeIntervalSince(s)
                }
            }
            .store(in: &bag)
    }

    func stop() {
        loc.stopUpdatingLocation()
        walks.append(points)
        bag.removeAll()
        state = .library
    }
}

extension WalkVM: CLLocationManagerDelegate {
    func locationManager(_ m: CLLocationManager, didUpdateLocations ls: [CLLocation]) {
        guard let cur = ls.last else { return }
        if let l = last { dist += cur.distance(from: l) }
        last = cur
        points.append(cur.coordinate)
    }
}

