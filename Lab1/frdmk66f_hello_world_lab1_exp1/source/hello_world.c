/*
 * Copyright (c) 2013 - 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_device_registers.h"
#include "fsl_debug_console.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"
#include "fsl_ftm.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/


/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/
/*!
 * @brief Main function
 */

#define FTM_MOTOR FTM0
#define FTM_CHANNEL_DC_MOTOR kFTM_Chnl_0
#define FTM_CHANNEL_SERVO kFTM_Chnl_3

void setupPWM()
{
	ftm_config_t ftmInfo;
	ftm_pwm_level_select_t pwmLevel = kFTM_HighTrue;

	ftm_chnl_pwm_signal_param_t ftmParamM;
	ftmParamM.chnlNumber = FTM_CHANNEL_DC_MOTOR;
	ftmParamM.level = pwmLevel;
	ftmParamM.dutyCyclePercent = 7;
	ftmParamM.firstEdgeDelayPercent = 0U;
	ftmParamM.enableComplementary = false;
	ftmParamM.enableDeadtime = false;
	FTM_GetDefaultConfig(&ftmInfo);
	ftmInfo.prescale = kFTM_Prescale_Divide_128;
	FTM_Init(FTM_MOTOR, &ftmInfo);
	FTM_SetupPwm(FTM_MOTOR, &ftmParamM, 1U, kFTM_EdgeAlignedPwm, 50U, CLOCK_GetFreq(
	kCLOCK_BusClk));
	FTM_StartTimer(FTM_MOTOR, kFTM_SystemClock);

	ftm_chnl_pwm_signal_param_t ftmParamS;
	ftmParamS.chnlNumber = FTM_CHANNEL_SERVO;
	ftmParamS.level = pwmLevel;
	ftmParamS.dutyCyclePercent = 7;
	ftmParamS.firstEdgeDelayPercent = 0U;
	ftmParamS.enableComplementary = false;
	ftmParamS.enableDeadtime = false;
	FTM_GetDefaultConfig(&ftmInfo);
	ftmInfo.prescale = kFTM_Prescale_Divide_128;
	FTM_Init(FTM_MOTOR, &ftmInfo);
	FTM_SetupPwm(FTM_MOTOR, &ftmParamS, 1U, kFTM_EdgeAlignedPwm, 50U, CLOCK_GetFreq(
	kCLOCK_BusClk));
	FTM_StartTimer(FTM_MOTOR, kFTM_SystemClock);

}

void updatePWM_dutyCycle(ftm_chnl_t channel, float dutyCycle)
{
	uint32_t cnv, cnvFirstEdge = 0, mod;
	/* The CHANNEL_COUNT macro returns -1 if it cannot match the FTM instance */
	assert(-1 != FSL_FEATURE_FTM_CHANNEL_COUNTn(FTM_MOTOR));
	mod = FTM_MOTOR->MOD;
	if (dutyCycle == 0U)
	{
		/* Signal stays low */
		cnv = 0;
	}
	else
	{
		cnv = mod * dutyCycle;
		/* For 100% duty cycle */
		if (cnv >= mod)
		{
		cnv = mod + 1U;
		}
	}

	FTM_MOTOR->CONTROLS[channel].CnV = cnv;
}

int main(void)
{
	 uint8_t ch;
	 int input1;
	 int input2;
	 float dutyCycle1;
	 float dutyCycle2;

	 BOARD_InitBootPins();
	 BOARD_InitBootClocks();

	 setupPWM();

	 /******* Delay *******/
	 for(volatile int i = 0U; i < 1000000; i++)
		 __asm("NOP");


	updatePWM_dutyCycle(FTM_CHANNEL_SERVO, 0.075);
	updatePWM_dutyCycle(FTM_CHANNEL_DC_MOTOR, 0.0615);

	FTM_SetSoftwareTrigger(FTM_MOTOR, true);
	scanf("%d %d", &input1, &input2);
	dutyCycle1 = input1 * 0.025f/100.0f + 0.0615;
	updatePWM_dutyCycle(FTM_CHANNEL_DC_MOTOR, dutyCycle1);
	dutyCycle2 = input2 * 0.025f/100.0f + 0.075;
	updatePWM_dutyCycle(FTM_CHANNEL_SERVO, dutyCycle2);
	FTM_SetSoftwareTrigger(FTM_MOTOR, true);
	printf("---\n");

	while (1)
	{
	}
}


