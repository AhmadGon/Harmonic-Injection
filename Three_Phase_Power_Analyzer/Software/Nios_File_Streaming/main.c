/*
 * main.c
 *
 *  Created on: Feb 18, 2020
 *      Author: Ahmad Al-Astal
 *
 *
 * This project is precisely for Dr.Saher Al-Batran from Jordan University of Science and Technology
 * This project is not for distribution, the main goal is to keep developing this system to achieve
 * the best possible performance out of DE2-115 for power circuit, the developer of this system is
 * Eng. Ahmad Al-Astal and he has the full right to prevent anyone from using this system out of it
 * main purpose, for now this is the release candidate.
 * */
#include "system.h"
#include "stdlib.h"
#include "stdio.h"
#include "stdbool.h"
#include "altera_avalon_pio_regs.h"
#include "alt_sys_init.c"

int main()
{

	FILE* PhaseA_Voltage_Save = fopen("/mnt/host/Readings/PhaseA_Voltage.txt","w");
	FILE* PhaseB_Voltage_Save = fopen("/mnt/host/Readings/PhaseB_Voltage.txt","w");
	FILE* PhaseC_Voltage_Save = fopen("/mnt/host/Readings/PhaseC_Voltage.txt","w");

	FILE* PhaseA_Current_Save = fopen("/mnt/host/Readings/PhaseA_Current.txt","w");
	FILE* PhaseB_Current_Save = fopen("/mnt/host/Readings/PhaseB_Current.txt","w");
	FILE* PhaseC_Current_Save = fopen("/mnt/host/Readings/PhaseC_Current.txt","w");

	unsigned int PhaseA_Voltage = 0;
	unsigned int PhaseB_Voltage = 0;
	unsigned int PhaseC_Voltage = 0;
	unsigned int PhaseA_Current = 0;
	unsigned int PhaseB_Current = 0;
	unsigned int PhaseC_Current = 0;
	unsigned int counter = 0;

	char sPhaseA_Voltage[10];
	char sPhaseB_Voltage[10];
	char sPhaseC_Voltage[10];

	char sPhaseA_Current[10];
	char sPhaseB_Current[10];
	char sPhaseC_Current[10];

	unsigned int Writing_Finish_Flag = 0;
	unsigned int Read_New_Sample = 0;
	unsigned int Read_Address = 0;

	while(1)
	{
HERE:	Writing_Finish_Flag = IORD(WRITING_FINISH_FLAG_BASE, 0);
		if (Writing_Finish_Flag)
		{
			if (Read_Address == 0) printf("\nTaking sample started, please wait\n");
			PhaseA_Voltage = IORD(CHANNEL1_ANALOG_BASE, 0);
			PhaseB_Voltage = IORD(CHANNEL2_ANALOG_BASE, 0);
			PhaseC_Voltage = IORD(CHANNEL3_ANALOG_BASE, 0);

			PhaseA_Current = IORD(CHANNEL4_ANALOG_BASE, 0);
			PhaseB_Current = IORD(CHANNEL5_ANALOG_BASE, 0);
			PhaseC_Current = IORD(CHANNEL6_ANALOG_BASE, 0);

			if(PhaseA_Voltage_Save != NULL && PhaseB_Voltage_Save != NULL && PhaseC_Voltage_Save != NULL &&
			   PhaseA_Current_Save != NULL && PhaseB_Current_Save != NULL && PhaseC_Current_Save != NULL &&
			   Writing_Finish_Flag == true )
			{
				itoa(PhaseA_Voltage,sPhaseA_Voltage,10);
				itoa(PhaseB_Voltage,sPhaseB_Voltage,10);
				itoa(PhaseC_Voltage,sPhaseC_Voltage,10);

				itoa(PhaseA_Current,sPhaseA_Current,10);
				itoa(PhaseB_Current,sPhaseB_Current,10);
				itoa(PhaseC_Current,sPhaseC_Current,10);

				fprintf(PhaseA_Voltage_Save,"%s\n",sPhaseA_Voltage);
				fprintf(PhaseB_Voltage_Save,"%s\n",sPhaseB_Voltage);
				fprintf(PhaseC_Voltage_Save,"%s\n",sPhaseC_Voltage);

				fprintf(PhaseA_Current_Save,"%s\n",sPhaseA_Current);
				fprintf(PhaseB_Current_Save,"%s\n",sPhaseB_Current);
				fprintf(PhaseC_Current_Save,"%s\n",sPhaseC_Current);

				IOWR(READ_ADDRESS_BASE, 0, Read_Address);
				counter++;
				Read_Address++;
			}
			if (counter == 4096) break;
		}
	}
	fclose(PhaseA_Voltage_Save);
	fclose(PhaseB_Voltage_Save);
	fclose(PhaseC_Voltage_Save);

	fclose(PhaseA_Current_Save);
	fclose(PhaseB_Current_Save);
	fclose(PhaseC_Current_Save);
	printf("Taking sample finished\nYou can now run the MATLAB script\n");
	while(1)
	{
		counter = 0;
		Read_Address = 0;
		Read_New_Sample = IORD(READ_NEW_SAMPLE_BASE, 0);
		if (Read_New_Sample == 1)
		{
			goto HERE;
		}
		//check my switch, if HIGH goto the first while loop else stay in this loop
	}
	return 0;
}
