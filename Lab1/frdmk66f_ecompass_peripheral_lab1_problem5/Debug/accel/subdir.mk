################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../accel/fsl_fxos.c 

OBJS += \
./accel/fsl_fxos.o 

C_DEPS += \
./accel/fsl_fxos.d 


# Each subdirectory must supply rules for building sources it contributes
accel/%.o: ../accel/%.c accel/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK66FN2M0VMD18 -DCPU_MK66FN2M0VMD18_cm4 -DPRINTF_FLOAT_ENABLE=1 -DPRINTF_ADVANCED_ENABLE=1 -DSDK_I2C_BASED_COMPONENT_USED=1 -DFRDM_K66F -DFREEDOM -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_BAREMETAL -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\utilities" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\drivers" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\accel" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\component\uart" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\component\lists" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\CMSIS" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\device" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\board" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\source" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\utilities" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\drivers" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\accel" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\device" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\component\uart" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\component\lists" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\CMSIS" -I"D:\4DS4\MCUXpressoIDE_11.5.0_7232\workspace\frdmk66f_ecompass_peripheral_lab1_problem5\frdmk66f\demo_apps\ecompass_peripheral" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


