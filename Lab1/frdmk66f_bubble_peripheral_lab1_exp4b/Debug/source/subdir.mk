################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/bubble.c \
../source/semihost_hardfault.c 

OBJS += \
./source/bubble.o \
./source/semihost_hardfault.o 

C_DEPS += \
./source/bubble.d \
./source/semihost_hardfault.d 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK66FN2M0VMD18 -DCPU_MK66FN2M0VMD18_cm4 -DPRINTF_ADVANCED_ENABLE=1 -DSDK_I2C_BASED_COMPONENT_USED=1 -DFRDM_K66F -DFREEDOM -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_BAREMETAL -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\drivers" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\accel" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\utilities" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\component\uart" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\component\lists" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\CMSIS" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\device" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\board" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\source" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\drivers" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\accel" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\utilities" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\device" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\component\uart" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\component\lists" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\CMSIS" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_bubble_peripheral_lab1_exp4b\frdmk66f\demo_apps\bubble_peripheral" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


