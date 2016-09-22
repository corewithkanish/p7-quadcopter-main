list.o list.d : ../Source/list.c ../Source/include/FreeRTOS.h FreeRTOSConfig.h \
  ../Source/include/projdefs.h ../Source/include/portable.h \
  ../Source/include/deprecated_definitions.h \
  ../Source/include/../portable/GCC_ATMega2560/portmacro.h \
  ../Source/include/mpu_wrappers.h ../Source/include/list.h
