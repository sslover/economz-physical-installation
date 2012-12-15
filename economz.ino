// economz - visualzing your carbon foodprint
// by Sam Slover in the fall of 2012
// for NYU's Interactive Telecommunications Program

#include <Wire.h>
#include <Adafruit_NFCShield_I2C.h>

#define IRQ   (2)
#define RESET (3)  // Not connected by default on the NFC Shield

Adafruit_NFCShield_I2C nfc(IRQ, RESET);

uint8_t uid[] = {   0, 0, 0, 0, 0, 0, 0   };  // Buffer to store the returned UID

// buttons

int switch5val;
int switch7val;


void setup(void) {
  Serial.begin(9600);
  // configure the digital input:
  pinMode(5, INPUT);
  pinMode(7, INPUT);
  nfc.begin();
  uint32_t versiondata = nfc.getFirmwareVersion();
  // configure board to read RFID tags
  nfc.SAMConfig();
}


void loop(void) {
//  if (digitalRead(5) == HIGH) {
//    Serial.println("success");
//  }
  uint8_t success;
  uint8_t uidLength;                        // Length of the UID (4 or 7 bytes depending on ISO14443A card type)

  // Wait for an ISO14443A type cards (Mifare, etc.).  When one is found
  // 'uid' will be populated with the UID, and uidLength will indicate
  // if the uid is 4 bytes (Mifare Classic) or 7 bytes (Mifare Ultralight)
  success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);

  if (success) {
    arrayCompare();
    delay(1000);
  }
}

void arrayCompare()
{
  // Comparing the differend RFID arrays to know which food item it is
  uint8_t card0[] = { 
    0x3A, 0x27, 0xF6, 0x12     };
  uint8_t card1[] = { 
    0x0A, 0x7B, 0xD3, 0xD6     };
  uint8_t card2[] = { 
    0x6A, 0x27, 0xD1, 0xD6     };
  uint8_t card3[] = { 
    0x8A, 0x8C, 0x5E, 0xBB     };
  uint8_t card4[] = { 
    0xCA, 0xFE, 0x56, 0xBB    };
  uint8_t card5[] = { 
    0x1A, 0xE3, 0xCD, 0xD6     };
  uint8_t card6[] = { 
    0x4A, 0x8A, 0xAF, 0xD6     };
  uint8_t card7[] = { 
    0x2A, 0x99, 0xD0, 0xD6     };
  uint8_t card8[] = { 
    0x0B, 0x13, 0x66, 0x39     };
  uint8_t card9[] = { 
    0x3A, 0x9C, 0xCF, 0xD6     };
  uint8_t card10[] = { 
    0x1A, 0x28, 0xCE, 0xD6     };
  uint8_t card11[] = { 
    0x8A, 0x71, 0xD3, 0xD6     };
  uint8_t card12[] = { 
    0x6A, 0x93, 0xCF, 0xD6     };
  uint8_t card13[] = { 
    0xBA, 0x11, 0xC6, 0xD6     };
  uint8_t card14[] = { 
    0x2A, 0x20, 0xA3, 0xD6    };
  uint8_t card15[] = { 
  0x1B, 0x2D, 0x5C, 0x39      };  
  uint8_t card16[] = { 
    0xCA, 0xB3, 0xCE, 0xD6     };
  uint8_t card17[] = { 
    0x9A, 0x92, 0xCB, 0xD6     };
  uint8_t card18[] = { 
    0x8A, 0xF9, 0x55, 0xD6     };
  uint8_t card19[] = { 
    0xCB, 0x7D, 0x65, 0x39     };
  uint8_t card20[] = { 
    0x2A, 0xCE, 0xD5, 0xD6     };
  uint8_t card21[] = { 
    0x1A, 0x20, 0xCE, 0xD6     };
  uint8_t card22[] = { 
    0xAA, 0x79, 0xD2, 0xD6     };  
  if(memcmp(card0, uid, 4) == 0)
  {
    Serial.println(44); 
  }
  if(memcmp(card1, uid, 4) == 0)
  {
    Serial.println(1);
  }
  if(memcmp(card2, uid, 4) == 0)
  {
    Serial.println(2); 
  }
  if(memcmp(card3, uid, 4) == 0)
  {
    Serial.println(3);
  }
  if(memcmp(card4, uid, 4) == 0)
  {
    Serial.println(4); 
  }
  if(memcmp(card5, uid, 4) == 0)
  {
    Serial.println(5);
  }
  if(memcmp(card6, uid, 4) == 0)
  {
    Serial.println(6); 
  }
  if(memcmp(card7, uid, 4) == 0)
  {
    Serial.println(7);
  }
  if(memcmp(card8, uid, 4) == 0)
  {
    Serial.println(8); 
  }
  if(memcmp(card9, uid, 4) == 0)
  {
    Serial.println(9);
  }
  if(memcmp(card10, uid, 4) == 0)
  {
    Serial.println(10); 
  }
  if(memcmp(card11, uid, 4) == 0)
  {
    Serial.println(11);
  } 
  if(memcmp(card12, uid, 4) == 0)
  {
    Serial.println(12); 
  }
  if(memcmp(card13, uid, 4) == 0)
  {
    Serial.println(13);
  }
  if(memcmp(card14, uid, 4) == 0)
  {
    Serial.println(14); 
  }
  if(memcmp(card15, uid, 4) == 0)
  {
    Serial.println(15);
  }
  if(memcmp(card16, uid, 4) == 0)
  {
    Serial.println(16); 
  }
  if(memcmp(card17, uid, 4) == 0)
  {
    Serial.println(17);
  } 
  if(memcmp(card18, uid, 4) == 0)
  {
    Serial.println(18); 
  }
  if(memcmp(card19, uid, 4) == 0)
  {
    Serial.println(19);
  }
  if(memcmp(card20, uid, 4) == 0)
  {
    Serial.println(20); 
  }
  if(memcmp(card21, uid, 4) == 0)
  {
    Serial.println(88);
  }
  if(memcmp(card22, uid, 4) == 0)
  {
    Serial.println(22); 
  }     
}





