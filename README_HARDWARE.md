# Hardware Report

* Schematic/PCB/CAD diagrams of all components of your project: in PDF format AND the actual CAD/CAM files
* Vendor information and Bill of Materials (BOM).
* References to significant data sheets, application notes, design templates, etc.
* Power requirements (voltage, current, power supply model, etc.).
* Clear picture of system inside the enclosure – use multiple angles if necessary.
* Significant data sheets, application notes, design templates, web resources.
* Photographs documenting the assembled system

Fob- 
The fob key is a device meant for our client to hold and use once they’ve reached one of the tour destinations which then communicates with the NFC. This device’s design is shown in the schematic below, mainly composed of a HUZZAH32 board, an IR diode, and IR LED, and H-bridge, and a button.  An ESP32 board serves as the heart, connecting all the components together. The IR diode is connected to one of the output PIN and grounded, the IR LED is connected to third PIN of the H-bridge through a 100-ohm resistor and grounded, the button is connected to plugged into a different output PIN, a 100-ohm resistor, and grounded. The H-bridges has the first and second PIN connected to two input PIN on the Esp32 board, and the fourth PIN is grounded. The board is powered by a lithium battery using the plug at its top and the Esp32 in turn powers all other components (H-bridge through the 16th PIN, the IR diode, and the button) using the 3.3V PIN. 

Near Field Communication(NFC)-
The NFC is a device meant to be located in the tour destinations awaiting communication from fob key to indicate a tourist’s presence. The design is similar to the fob: HUZZAH32 board, one IR LED, on IR diode, and one H-bridge, with the exception of the button, as there is no need to have the used physically interact with the NFC. The device functions as a hub meant to communicate with fob. 

Fob and NFC interaction-
The two devices work as a pair communicating wirelessly using the IR diode as the emitter and the IR LED as the receiver. The basic concept of the interaction is as follows: 
-the user reaches the tour destination and is in range of the NFC
-the user pushed the fob button which triggers its IR diode to send a signal which contains the fob ID
-the NFC IR LED receives the fob signal and ID compares it to the ID it is coded to find
-if confirmed, the NFC sends a signal a confirmation to the fob through its IR diode and the confirmation is received by the fob’s IR LED 
After establishing the basic communication, we were considering placing an LED on the fob meant to light up when the hub sends back confirmation to signal a successful interaction for the user. The ID authentication would not take place on the hardware, but in the software half of the design. (This part was not complete). The hub would also have its own ID to signify its location to the app (further development of the project would anticipate multiple destination points thus multiple hubs and different visual experiences).

Resources used:
-our client C code was modified to code both the hub and Fob key
