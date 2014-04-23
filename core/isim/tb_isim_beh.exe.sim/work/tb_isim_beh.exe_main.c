/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *UNISIM_P_0947159679;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    unisim_p_0947159679_init();
    xilinxcorelib_a_4043971743_3212880686_init();
    xilinxcorelib_a_2955547744_3212880686_init();
    xilinxcorelib_a_0666305930_3212880686_init();
    xilinxcorelib_a_2207967384_3212880686_init();
    work_a_1156261981_3330682609_init();
    work_a_1200803988_0197700266_init();
    work_a_1955129939_0949684337_init();
    work_a_2020541174_3518520759_init();
    work_a_2499495094_2340374602_init();
    work_a_1262407629_1527041701_init();
    unisim_a_0780662263_2014779070_init();
    unisim_a_1490675510_1976025627_init();
    work_a_1335952598_3823007873_init();
    work_a_3671711236_2372691052_init();


    xsi_register_tops("work_a_3671711236_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");

    return xsi_run_simulation(argc, argv);

}
