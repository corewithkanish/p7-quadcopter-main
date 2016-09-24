IMPORTANT! These drivers are NOT suitable for AVR Studio 4. 

===General information=== 

This is a Windows driver for Olimex AVR-ISP-MK2 for Atmel Studio 
releases. This driver requires AVR-ISP-MK2 unit loaded with the firmware 
suitable for Atmel Studio (this is the default factory firmware). The 
same driver and firmware can be used also with AVRDUDE 6.x.x and newer 
Arduino IDE releases (that use AVRDUDE v6.x.x) under Windows without any 
patches. 

Refer to AVR-ISP-MK2's user's manual for more details. 

==How to install this driver?== 

Open "Windows Device Manager" and find the entry for AVR-ISP-MK2 - 
typically a sub-entry in the "Jungo" group of drivers named "AVRISP 
mkII". Right-click over that entry and manually update the driver - e.g. 
point to the directory where you extracted this archive. 

Alternatively, use the executable installers - if you have 64-bit 
operating system go for installer_x64 and if you have 32-bit operating 
system go for installer_x86.exe 

If the driver installation is successfull a new entry in the "LibUSB" 
group would appear. Refer to picture "properly_installed_drivers.png" on 
how a properly installed driver looks like. 

==Who made this drivers?== 

These drivers are provided by Dean Camera and carry the Atmel signature. 

==What setups exactly did you test?== 

They are tested with LUFA programmers (Olimex AVR-ISP-MK2 is a LUFA 
programmer) and confirmed working with Atmel Studio 6.x and Atmel Studio 
7.x under Windows 7, Windows 8.1 and Windows 10. These drivers seem to 
work fine with newer AVRDUDE versions out-of-the-box (AVRDUDE 6.2 was 
tested, and also Arduino IDE v 1.6.7 which comes with AVRDUDE 6.0.1). 

Refer to this issue thread for more information about the drivers: 

https://github.com/abcminiuser/lufa/issues/63#issuecomment-176824766 

==I want to use AVR Studio 4.19 under Windows 10== 

AVR Studio 4.19 was released in September 2011. The Atmel team abandoned 
the support for AVR Studio 4 long time ago. If you aim to use AVR Studio 
4.19 it is strongly recommended to use operating system released prior 
to September 2011 (and the system had not been updated past that point). 

The author of this document did not find a way use AVR-ISP-MK2 with AVR 
Studio 4.19 under Windows 10 at the moment of writing - no drivers 
seemed to work for this combination. You can use AVR Studio 4.19 under 
Windows 7 or Windows 8.1 - assuming that you also use 
"driver-atmel-bundle-7.0.888.exe" since newer drivers work only for 
Atmel Studio 7 - I also strongly suggest to look at this:
 
http://atmel.force.com/support/articles/en_US/FAQ/Downgrading-tools-to-use-older-Jungo-driver

If you have found a way to use AVR-ISP-MK2 with 
AVR Studio 4.19 under Windows 10 please either send an e-mail to 
support@olimex.com or post in the official Olimex forums. 

Consider that it is a good idea to move on to Atmel Studio 6 (if you 
plan to use Windows 7 or Windows 8) or straight to Atmel Studio 7 (if 
you plan to use Windows 10). 



