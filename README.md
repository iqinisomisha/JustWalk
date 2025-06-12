# JustWalk

JustWalk is a lightweight SwiftUI app for iOS and iPadOS that records your walking routes. The app keeps track of distance and elapsed time while drawing your path on screen. When you're finished you can browse previous walks in a simple library view.

## Building
1. Open `JustWalk3/JustWalk3.xcodeproj` in Xcode.
2. Select the *JustWalk3* scheme and your desired simulator or device.
3. Build and run the project (`⌘R`).

The project targets iOS 14 and later and relies only on the standard Apple frameworks (SwiftUI, CoreLocation). No extra dependencies are required.

## Usage
1. Launch the app on your device or simulator.
2. Tap the smiley face to start a walk. The app will request location permissions if needed.
3. Your route, distance in kilometers and elapsed time will update as you walk.
4. Tap "Stop walk" to finish and save the route.
5. Previous walks are shown in the library view, accessible after stopping a walk.

Feel free to clone the repository and modify the project for your own experiments.
