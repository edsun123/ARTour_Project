# 20-25-Artour

## Engineering Addendum

###### iOS Application Quick Start

**Requirements**
* Apple computer running Xcode 11, Swift 5
* iPhone running iOS 13 or greater

**How To Run**
1. In the folder ARtour, open `ARtour.xcworkspace`
2. Connect the iPhone to the computer and run the application on the phone

**Current Status**
* The iOS application has the AR framework already built-in and the destination of Photonics is hard coded in
* This version does not have beacon connectivity enabled => See the beacons quick start guide below for more info on this
* This version does not pull tour information from the Firestore database. Once beacon connectivity has been established, each time a signal is received the application is supposed to pull info based on location and display that info in the AR experience.

**Troubleshooting**
* Make sure the file `GoogleService-Info.plist` is located in the Downloads folder. If this error still persists, a new one may need to be downloaded from the Google Firebase Project. See the file `README_SOFTWARE.md` for more information on Firebase.

###### Beacons Quick Start

**Requirements**
* ESP 32 HUZZAH Boards and Cable
* Rechargable AA Batteries

**How To Run**
1. Run the project `~/beacons/beacon_test_apps/RangingForBeacons/Beacon Sample/Beacon Sample.xcodeproj` on an iPhone following the same steps to run the iOS Application.
2. In the folder beacons, upload the file `fob.c` to the ESP 32 HUZZAH boards
3. Turn the beacons on by connecting the ESP 32 HUZZAH boards to the battery

**Current Status**
* We have yet to decide on batteries, so any that work to power the HUZZAH boards can be used
* This project shows how to establish a connection to an iPhone and beacons using the UUID, major, minor, and RSSI valuse. This project can serve as an example for establishing a connection between the iOS application with built-in AR framework and developed beacons.

**Troubleshooting**
