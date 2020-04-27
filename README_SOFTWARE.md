# Software Report

## iOS Application Module

**User Story**

The user will be given a one-time passkey along with a headset at the start of the tour in the Engineering Undergradute Office. When the user launches the application, they are brought to the tour selection page. Here, the user selects the tour they would like to join and enters the passkey, when prompted. The user will not be able to proceed until they enter a valid passkey. Once the user enters a valid passkey, they are take to the start page which gives the user the option to launch the AR experience or submit any questions they have.

**Firestore Database**

This application is connected to Google Firebase and uses a Firestore database. For access to the project, please email snevarez@bu.edu.

[Insert Photo of DB Layout]

The database serves two purposes:
1. All the tour groups are created in the database. When the application checks for a valid passkey, the user entry is checked against the groups in the database. When a valid key is found, a new document is created for the user in the group. When a user submits a question, it is saved in the database connected to the user's document. If the user also submits their email, it also gets saved in the user's document.
2. All the tour information that appears in the AR experience is stored here. When the application is by a beacon, the application reads from the database the information related to its current location and displays that information for the user to see. This is also where the information would be updated if the need were to arise.

## AR Framework

**GPS Navigation**

GPS navigation is used to guide the user when they are outdoors - for this projec this was from the back entrance of Ingalls to Photonics along Cummington Mall. To accomplish this, our team used an ARSCNView target (part of the ARKit Library) to display the AR content and MapKitView to update the user’s location throughout the process. This GPS navigation system works by first determining an initial position by getting the user’s current location through the iPhone. Next, an end point is established. For testing purposes, our team hardcoded this to be the entrance to the Mechanical Engineering building. Once the start and end points have been established, the final step is to render AR content to guide the user from start to finish. We decided to use MapKitView to calculate the route and generate the necessary steps to arrive at the destination. Each step, configured to standard GPS coordinate from source to destination, creates a node where a 3D sphere would be placed for the user to follow to the destination. As the users move, the proportion of the sphere will change to adjust to change of view but will retain its GPS coordinates.

**AR Content**

To create content for the tour, our team created 3D models using Autodesk Maya and Unity. These models which include a BU logo, MechE logo, and an arrow, were exported into a .dae file type and added to the iOS application. They can be found in the Graphics folder in `Model Showing` and `Test1`. `MuseumAR` is a demo project we planned to use as a guide to create pop ups to display information.

## Beacons

Even though we were not fully able to incorporate the beacons into the iOS application, our team built a parallel iOS application to perform tests until we were satisfied beacon technology was accurate enough for our purposes. This application communicated with the beacons via BLE and displayed a table of all the beacons within range. The beacons were given a specific UUID corresponding to our project to prevent other Bluetooth devices from connecting accidentally. Each beacon that appeared in the table displayed its major, minor, and RSSI value. For testing, our team used this application and beacons to conduct a stagnant test and later a walking test to determine the most accurate range of the beacons. During stagnant tests, distances were marked out, one meter apart, and the RSSI value at each marking was recorded. For walking tests, we started 16 meters away from the beacon and walked toward it at a steady pace, recording both the time it took to get from one point to the other as well as each RSSI value the application read. In addition to stagnant and moving tests, our team also tested multiple beacons at once while walking around the Photonics lobby. Each beacon was identified by its minor value and then checked to see if there was any delay. Some delay was found when trying to determine the nearest beacon most likely due to looping through all the beacons to find the lowest RSSI value.

## Module Flow Chart

![](/SoftwareFlowChart.jpg)

1. The iOS application verifies the passkey entered by the user in the Firestore database.
2. Beacons send signals to the iOS application via BLE providing location information.
3. The iOS application uses it current location to read tour information from the Firestore database.
4. The iOS application tells the AR framework what content to display.

## System Requirements

* An Apple computer running Xcode 11 and Swift 5 or greater
* An iPhone running iOS 13 or greater
* Google Firebase Firestore Database
* Most recent versions of Autodesk Maya and Unity
