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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/kentaro/core/receiver.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );


static void work_a_2499495094_2340374602_p_0(char *t0)
{
    char t22[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned char t21;
    unsigned int t23;
    unsigned int t24;

LAB0:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3944);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t3 = (t0 + 6279);
    t6 = xsi_mem_cmp(t3, t4, 2U);
    if (t6 == 1)
        goto LAB6;

LAB11:    t7 = (t0 + 6281);
    t9 = xsi_mem_cmp(t7, t4, 2U);
    if (t9 == 1)
        goto LAB7;

LAB12:    t10 = (t0 + 6283);
    t12 = xsi_mem_cmp(t10, t4, 2U);
    if (t12 == 1)
        goto LAB8;

LAB13:    t13 = (t0 + 6285);
    t15 = xsi_mem_cmp(t13, t4, 2U);
    if (t15 == 1)
        goto LAB9;

LAB14:
LAB10:
LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(66, ng0);
    t16 = (t0 + 4024);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)2;
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t21 = (t2 == (unsigned char)3);
    if (t21 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB5;

LAB7:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t21 = (t2 == (unsigned char)3);
    if (t21 != 0)
        goto LAB21;

LAB23:
LAB22:    goto LAB5;

LAB8:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t21 = (t2 == (unsigned char)3);
    if (t21 != 0)
        goto LAB26;

LAB28:
LAB27:    goto LAB5;

LAB9:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t21 = (t2 == (unsigned char)3);
    if (t21 != 0)
        goto LAB31;

LAB33:
LAB32:    goto LAB5;

LAB15:;
LAB16:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t1 = (t0 + 4088);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t4, 8U);
    xsi_driver_first_trans_delta(t1, 24U, 8U, 0LL);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 6176U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t22, t3, t1, 1);
    t5 = (t22 + 12U);
    t23 = *((unsigned int *)t5);
    t24 = (1U * t23);
    t2 = (2U != t24);
    if (t2 == 1)
        goto LAB19;

LAB20:    t7 = (t0 + 4152);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 2U);
    xsi_driver_first_trans_fast(t7);
    goto LAB17;

LAB19:    xsi_size_not_matching(2U, t24, 0);
    goto LAB20;

LAB21:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t1 = (t0 + 4088);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t4, 8U);
    xsi_driver_first_trans_delta(t1, 16U, 8U, 0LL);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 6176U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t22, t3, t1, 1);
    t5 = (t22 + 12U);
    t23 = *((unsigned int *)t5);
    t24 = (1U * t23);
    t2 = (2U != t24);
    if (t2 == 1)
        goto LAB24;

LAB25:    t7 = (t0 + 4152);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 2U);
    xsi_driver_first_trans_fast(t7);
    goto LAB22;

LAB24:    xsi_size_not_matching(2U, t24, 0);
    goto LAB25;

LAB26:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t1 = (t0 + 4088);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t4, 8U);
    xsi_driver_first_trans_delta(t1, 8U, 8U, 0LL);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 6176U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t22, t3, t1, 1);
    t5 = (t22 + 12U);
    t23 = *((unsigned int *)t5);
    t24 = (1U * t23);
    t2 = (2U != t24);
    if (t2 == 1)
        goto LAB29;

LAB30:    t7 = (t0 + 4152);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 2U);
    xsi_driver_first_trans_fast(t7);
    goto LAB27;

LAB29:    xsi_size_not_matching(2U, t24, 0);
    goto LAB30;

LAB31:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t1 = (t0 + 4088);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t4, 8U);
    xsi_driver_first_trans_delta(t1, 0U, 8U, 0LL);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 6287);
    t4 = (t0 + 4152);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 4024);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB32;

}


extern void work_a_2499495094_2340374602_init()
{
	static char *pe[] = {(void *)work_a_2499495094_2340374602_p_0};
	xsi_register_didat("work_a_2499495094_2340374602", "isim/tb_isim_beh.exe.sim/work/a_2499495094_2340374602.didat");
	xsi_register_executes(pe);
}
