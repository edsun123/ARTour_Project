# 20-25-Artour

## Engineering Addendum

## iOS Application Quick Start

**Requirements**
* Apple computer running Xcode 11, Swift 5
* iPhone running iOS 13 or greater

**How To Run**
1. Open `ARtour/ARtour.xcworkspace` in Xcode
2. Connect the iPhone to the computer and run the application on the iPhone. The application requires the use of the phone's current location for GPS navigation

**Current Status**
* This version has the AR framework already built-in and the destination of Photonics is hard coded in
* This version does not have beacon connectivity enabled (see the beacons quick start guide below for more on this)
* This version does not pull tour information from the Firestore database. Each time a signal is received the application is supposed to pull info based on its location and display that info in the AR experience

**Troubleshooting**
* Make sure the file `GoogleService-Info.plist` is located in the Downloads folder. If this error still persists, a new one may need to be downloaded from the Google Firebase Project. See the file `README_SOFTWARE.md` for more information on Firebase

## Beacons Quick Start

**Requirements**
* ESP 32 HUZZAH Boards and Cable
* Rechargable AA Batteries

**How To Run**
1. Run the project `beacons/beacon_test_apps/RangingForBeacons/Beacon Sample/Beacon Sample.xcodeproj` on an iPhone following the same steps to run the iOS application
2. Upload the files `beacons/ibeacon/beacon/main/ibeacon_demo.c` to the ESP 32 HUZZAH boards
3. Turn the beacons on by connecting the ESP 32 HUZZAH boards to the battery

**Current Status**
* We have not yet decided on specific batteries, so any that work to power the HUZZAH boards can be used
* This project shows how to establish a connection to an iPhone and beacons using the UUID, major, minor, and RSSI values
* This project was going to serve as a how to for us to establish a connection between our iOS application and beacons
