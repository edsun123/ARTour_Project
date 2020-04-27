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
* This version does not have beacon connectivity enabled (see the beacons quick start guide below for more info)
* This version does not pull tour information from the Firestore database (see README_SOFTWARE.md for more info on the Firestore database)
* This version does not allow a user to exit the AR experience without closing the application completely. A redesign of the storyboard may be required to solve this

**Troubleshooting**
* Make sure the file `GoogleService-Info.plist` is located in the Downloads folder. If this error still persists, a new one may need to be downloaded from the Google Firebase Project
* The application uses files from `ARKitNavigationDemo` so make sure that folder is also downloaded and in the same location as `ARtour`

## Beacons Quick Start

**Requirements**
* ESP 32 HUZZAH Boards and Cable
* Batteries

**How To Run**
1. Run the project `beacons/beacon_test_apps/RangingForBeacons/Beacon Sample/Beacon Sample.xcodeproj` on an iPhone following the same steps to run the iOS application
2. Upload the files `beacons/ibeacon/beacon/main/ibeacon_demo.c` to the ESP 32 HUZZAH boards
3. Turn the beacons on by connecting the ESP 32 HUZZAH boards to the battery

**Current Status**
* We have not yet decided on specific batteries, so any that work to power the HUZZAH boards can be used
* This project shows how to establish a connection to an iPhone and beacons using the UUID, major, minor, and RSSI values
* This project can serve as a "how to" for establishing a connection between our iOS application and beacons

**Troubleshooting**
* The application may be slow to detect a new beacon which is most likely due to looping through all the beacon signals and selecting the one with the smallest RSSI (this would be the beacon the user is nearest).

## Yet To Finish

The remaining tasks to complete the project are:
1. Merging all three deliverables: AR application, beacons, and fob
2. Display the appropriate AR content based on which beacon the user is nearest to
3. Build content and graphics for specific points of interest for the indoors experience and add it with the application
4. Reach goals - navigation between floors, navigating between other colleges, incorporate video content to the AR experience

