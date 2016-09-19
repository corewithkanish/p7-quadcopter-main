The firmware binaries in this folder work only with Atmel/Jungo drivers
(they are used mainly for AVR/Atmel Studio)!!!

The firmware had been tested and confirmed working with AVR Studio 4, Atmel
Studio 5, Atmel Studio 6 and Atmel Studio 7.

The firmware binaries can be uploaded to AVR-ISP-MK2 via Atmel Flip.

The drivers you have to use with the firmware are the Atmel USB/Jungo drivers.

Make sure any libusb or libusb-win32 drivers are removed and uninstalled completly
before you install the Atmel USB drivers else you would encouter driver mismatches.
These driver mismatches cause a lot of headache!

Always use the latest binary!

AVR456-studio-AVRISP-MKII.hex - based on latest stable LUFA as of 06/01/2015 - contains 
fixes for the LED behavior

AVR456-studio-AVRISP-MKII_old_1.hex

AVR456-studio-AVRISP-MKII_old_2.hex

AVR456-studio-AVRISP-MKII_old_3.hex

Refer to the user's manual for more information.