/*
this code is creating a ESP32 BLE low energy beacon
*/

#define BEACON_UUID 0468492e-fada-89dc-6475-18753956763f
void app_main{
esp32_ble_beacon:
	type: iBeacon
	uuid: BEACON_UUID
}

//#include "BLEDevice.h"
/*#include "sys/time.h"

#include "BLEUtils.h"
#include "BLEServer.h"

#include "BLEBeacon.h"
#include "esp_sleep.h"
//the ESP32 wil lbe in deep sleep for 10sec, advertise, then go to deep sleep again
#define GPIO_DEEP_SLEEP_DURATION 10
#define BEACON_UUID "533d90da-d014-c056-890b-ccfd65c7a850"//universally unique id

RTC_DATA_ATTR static time_t last;
RTC_DATA_ATTR static uint32_t bootcount;

BLEAdvertising *pAdvertising;

struct timeval now; //defined as strut to acccess current time

void setBeacon(){
		BLEBeacon oBeacon = BLEBeacon();
		oBeacon.setManufacturerID(0x4C00);
		oBeacon.setProximityUUID(BLEUUID_UUID);
			oBeacon.setMajor((bootcount & 0xFFFF0000)>> 16);
			oBeacon.setMinor(bootcount& 0xFFFF);

			oAdvertisementData.setFlags(0x04);
			std::string strServiceData = "";

			strServiceData += (char)26;     // Len
			strServiceData += (char)0xFF;   // Type
			strServiceData += oBeacon.getData();
			oAdvertisementData.addData(strServiceData);

			pAdvertising->setAdvertisementData(oAdvertisementData);
			pAdvertising->setScanResponseData(oScanResponseData);
	}
void setup() {

	  Serial.begin(115200);
	  gettimeofday(&now, NULL);
	  Serial.printf("start ESP32 %d\n", bootcount++);
	  Serial.printf("deep sleep (%lds since last reset, %lds since last boot)\n", now.tv_sec, now.tv_sec - last);
	  last = now.tv_sec;

	  // Create the BLE Device
	  BLEDevice::init("ESP32 as iBeacon");
	  // Create the BLE Server
	  BLEServer *pServer = BLEDevice::createServer(); // <-- no longer required to instantiate BLEServer, less flash and ram usage
	  pAdvertising = BLEDevice::getAdvertising();
	  BLEDevice::startAdvertising();
	  setBeacon();
	  // Start advertising
	  pAdvertising->start();
	  Serial.println("Advertizing started...");
	  delay(100);
	  pAdvertising->stop();
	  Serial.printf("enter deep sleep\n");
	  esp_deep_sleep(1000000LL * GPIO_DEEP_SLEEP_DURATION);
	  Serial.printf("in deep sleep\n");
	}
	void loop() {
	}*/
