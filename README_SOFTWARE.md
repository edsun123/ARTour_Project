# Software Report

* An overview of each software module
* A flow chart indicating the high-level dependencies between these functions.
* Dev/build tool information: Package name and version info. For example, OpenCV 4.0.3 with Python 3.8.1, using CUDA Toolbox 10.0 and GCC 9.1 and CMake 3.14.2
* How to install the project software stack from scratch (a blank hard drive / cloud instance) Please provide concise documentation on what installation software is needed, and how to build from source to binary as applicable.


All of the software required for our project is incorporated in the application. The App has to main parts: Front-End and Back-End. Each of these has different modules:

  Front-End:
  
          Visible part: prior to launching the application, the users would be given a one-time passkey along with the headset at the official Boston University tour office. Afterwards, when the users launch the App, first they see a welcome page and then the user selects the tour they would like to join and enters the passkey, previously given to him, when prompted. When the user enters a valid passkey, the start page displays for the user to begin the experience. An additional feature that our team added is an option for the user to submit any questions they have along with an email for the answers to be sent to.

          Firestone database: this database is used for two purposes:
                  - check if the password introduced by the user is correct and, therefore letting him?her continue onto the ARTour.
                  - Gather all the questions that the users have come up with in order to, ultimately respond them. Also, it is a good system to track whether there is an error needed to be fixed or to check for content to be added.
  
  Back-End (AR Framework + Beacons):
  
          Outdoor Navigation: this module's objective is to guide the user from Ingalls to Photonics building entrance.  To accomplish this, our team used an ARSCNView target (part of the ARKit Library) to display the AR content and MapKitView to update the user’s location throughout the process. Outdoor navigation works by first determining an initial position by getting the user’s current location. Next, an end point is established. For testing purposes, our team hardcoded this to be the entrance to the mechanical engineering building. Once the starting and ending points have been established, the final step is to render AR content to guide the user from start to finish. We decided to use MapKitView to calculate the route and generate the necessary steps to arrive at the destination. Each step, configured to standard GPS coordinate from source to destination, creates a node where a 3D sphere would be placed for the user to follow to the destination. As the users move, the proportion of the sphere will change to adjust to change of view but will retain their GPS coordinates.
          
          Models: we build some 3D models using Autodesk Maya and Unity. Later we exported it into a .dae file type and merged it into the App. The models done include a BU logo, MechE logo, an arrow (we were planning on using it for indoor navigation).
          
          Beacons App: even though we were not fully able to incorporate the beacons into the App, we did build a parallel iOS application to continue performing tests until we knew the beacon technology was accurate enough for our purposes. Our team developed another iOS application that communicated with the beacons via BLE. The application displayed a table of all the beacons within range that were given the specific UUID corresponding to our project to prevent other Bluetooth devices from also accidentally connecting. Each beacon that appeared in the table displayed its major, minor, and RSSI value. For testing, our team used the app and beacons first stagnantly and later by walking around at a steady pace allowing us to determine the most accurate range of the beacons. During stagnant tests, distances were marked out, all one meter apart, and the RSSI value at each marking was recorded. For moving tests, we started 16 meters away from the beacon and walked toward it at a steady pace, recording both the time it took to get from one point to the other as well as each RSSI value the application read. In addition to stagnant and moving tests, our team also tested multiple beacons at once while walking around the Photonics lobby. Each beacon was identified by its minor value and then checked to see if there was any delay. Some delay was found when trying to determine the nearest beacon most likely due to looping through all the beacons to find the lowest RSSI value. Also, an application was done were the iPhone's screen would change color depending on what beacon it was sensing closer.
