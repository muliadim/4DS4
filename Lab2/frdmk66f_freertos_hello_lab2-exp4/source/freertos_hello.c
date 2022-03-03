/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/* FreeRTOS kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"


/* Freescale includes. */
#include "fsl_device_registers.h"
#include "fsl_debug_console.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"

SemaphoreHandle_t semaphore;

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/* Task priorities. */
#define hello_task_PRIORITY (configMAX_PRIORITIES - 1)
/*******************************************************************************
/*******************************************************************************
 * Code
 ******************************************************************************/
/*!
 * @brief Application entry point.
 */

void hello_task(void *pvParameters)
{
	BaseType_t status;
	while(1){
		status = xSemaphoreTake(semaphore, portMAX_DELAY);
		if (status != pdPASS){
			PRINTF("Failed to acquire consumer_semaphore\r\n");
			while(1);
		}
		PRINTF("Semaphore received\r\n");
	}
}

void timerCallbackFunction(TimerHandle_t timer_handle)
{
	xSemaphoreGive(semaphore);
}
void timerCallbackFunction2(TimerHandle_t timer_handle)
{
	static int counter = 0;
	PRINTF("Hello from the periodic timer callback. Counter = %d\r\n", counter);
	counter++;
	if(counter >= 10)
		xTimerStop(timer_handle, 0);
}


int main(void)
{
    /* Init board hardware. */
	BaseType_t status;
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();

    semaphore = xSemaphoreCreateBinary(); //Consumer semaphore

    status = xTaskCreate(hello_task, "Hello_task", 200, (void*)semaphore, 2, NULL);
    if (status != pdPASS)
    {
    	PRINTF("Task creation failed!.\r\n");
    	while (1);
    }
    TimerHandle_t timer_handle = xTimerCreate("Periodic timer",
    		1000 / portTICK_PERIOD_MS,
			pdTRUE,
			(void*)semaphore,
			timerCallbackFunction);
    status = xTimerStart(timer_handle, 0);
    if(status != pdPASS)
    {
    	PRINTF("Couldn’t start the timer!.\r\n");
    	while (1);
    }
    vTaskStartScheduler();
    while (1)
    {}
}

/*!
 * @brief Task responsible for printing of "Hello world." message.
 */
