# Beacons

Our beacons were made using HUZZAH32 boards and a power source. Each Beacon was uploaded with iBeacon specific code using the ESP32 library, with minor changes to identification (major and minor) in order for our app to differentiate when positioning the user. All beacons were assigned to be SENDER as they would be transmitting the bluetooth signal to the app.

## Identification

The identification variables all played different roles for the beacons:
  - UUID: Stayed constant for all beacons. It was used to differentiate our beacon signal from other bluetooth devices in the area.
  - Major: Assigned by location. Each building which contained beacons, in our case Ingalls, the Mechanical Engineering Building, and    Photonics.
  - Minor: Different for each beacon. It is the main identification for individual beacons which would be used to position the user in the building based on the signal strength.

## RSSI Data

Two types of testing were used to collect RSSI data from our beacons

- Stagnant: RSSI values are measured at a single distance and recorded. Distances are marked 1m apart from 1-7m
- Steady walking pace: RSSI values are measured and recorded as the user walks toward the beacon from the maximum range of 16m. The time spent walking was recorded to determine the speed.

Through our testing we were able to find that the beacon signal was able to be reached from upto 16m away. Using both stagnant and steady walking pace testing, we found that the optimal distance where the RSSI readings were most linear was between 5-6m. We concluded that in order to have the best positioning, our beacons should be placed between 5-6m apart when mapping each building.

## Mapping

The beacons were mapped out according to outlets available in each of the three buildings in order to minimize the need for regularly recharging or replacing batteries. When placing our beacons at these outlets with optimal distance between them, trilateration would be used with the RSSI values to pinpoint the user’s location as they walk through the buildings.


# Fob

The fob key is a device meant for our client to hold and use once they’ve reached one of the tour destinations which then communicates with the NFC. This device’s design is shown in the schematic below, mainly composed of a HUZZAH32 board, an IR diode, and IR LED, and H-bridge, and a button.  An ESP32 board serves as the heart, connecting all the components together. The IR diode is connected to one of the output PIN and grounded, the IR LED is connected to third PIN of the H-bridge through a 100-ohm resistor and grounded, the button is connected to plugged into a different output PIN, a 100-ohm resistor, and grounded. The H-bridges has the first and second PIN connected to two input PIN on the Esp32 board, and the fourth PIN is grounded. The board is powered by a lithium battery using the plug at its top and the Esp32 in turn powers all other components (H-bridge through the 16th PIN, the IR diode, and the button) using the 3.3V PIN. 

# Near Field Communication(NFC)

The NFC is a device meant to be located in the tour destinations awaiting communication from fob key to indicate a tourist’s presence. The design is similar to the fob: HUZZAH32 board, one IR LED, on IR diode, and one H-bridge, with the exception of the button, as there is no need to have the used physically interact with the NFC. The device functions as a hub meant to communicate with fob. 

# Fob and NFC interaction

The two devices work as a pair communicating wirelessly using the IR diode as the emitter and the IR LED as the receiver. The basic concept of the interaction is as follows: 
-the user reaches the tour destination and is in range of the NFC
-the user pushed the fob button which triggers its IR diode to send a signal which contains the fob ID
-the NFC IR LED receives the fob signal and ID compares it to the ID it is coded to find
-if confirmed, the NFC sends a signal a confirmation to the fob through its IR diode and the confirmation is received by the fob’s IR LED 
After establishing the basic communication, we were considering placing an LED on the fob meant to light up when the hub sends back confirmation to signal a successful interaction for the user. The ID authentication would not take place on the hardware, but in the software half of the design. (This part was not complete). The hub would also have its own ID to signify its location to the app (further development of the project would anticipate multiple destination points thus multiple hubs and different visual experiences).

fob schematic
![image](https://user-images.githubusercontent.com/24261732/80330716-e969c280-8813-11ea-9b19-69323735bb69.png)


![image](https://user-images.githubusercontent.com/24261732/80330776-15854380-8814-11ea-95e7-cc844883e3cb.png)
This is what the fob would look like had the device been completed. This is a reference picture from a former project

# Resources
  - our client C code was modified to code both the hub and Fob key
  - https://github.com/espressif/esp-idf
