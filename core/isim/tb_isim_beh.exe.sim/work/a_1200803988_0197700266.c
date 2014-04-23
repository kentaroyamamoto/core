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
static const char *ng0 = "/home/kentaro/core/u232c.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );
char *ieee_p_3620187407_sub_2255506239096238868_3965413181(char *, char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_970019341842465249_3965413181(char *, char *, char *, int );


static void work_a_1200803988_0197700266_p_0(char *t0)
{
    char t14[16];
    char t17[16];
    char t30[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;

LAB0:    xsi_set_current_line(21, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4240);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(22, ng0);
    t3 = (t0 + 2152U);
    t4 = *((char **)t3);
    t3 = (t0 + 6519);
    t6 = xsi_mem_cmp(t3, t4, 4U);
    if (t6 == 1)
        goto LAB6;

LAB8:
LAB7:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 6408U);
    t2 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t3, t1, 0);
    if (t2 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 6408U);
    t4 = ieee_p_3620187407_sub_2255506239096238868_3965413181(IEEE_P_3620187407, t14, t3, t1, 1);
    t5 = (t14 + 12U);
    t21 = *((unsigned int *)t5);
    t27 = (1U * t21);
    t2 = (16U != t27);
    if (t2 == 1)
        goto LAB24;

LAB25:    t7 = (t0 + 4480);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 16U);
    xsi_driver_first_trans_fast(t7);

LAB18:
LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(24, ng0);
    t7 = (t0 + 1352U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB5;

LAB9:;
LAB10:    xsi_set_current_line(25, ng0);
    t7 = (t0 + 1192U);
    t11 = *((char **)t7);
    t7 = (t0 + 6523);
    t15 = ((IEEE_P_2592010699) + 4000);
    t16 = (t0 + 6392U);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 0;
    t19 = (t18 + 4U);
    *((int *)t19) = 0;
    t19 = (t18 + 8U);
    *((int *)t19) = 1;
    t20 = (0 - 0);
    t21 = (t20 * 1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t11, t16, (char)97, t7, t17, (char)101);
    t21 = (8U + 1U);
    t22 = (9U != t21);
    if (t22 == 1)
        goto LAB13;

LAB14:    t19 = (t0 + 4352);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t13, 9U);
    xsi_driver_first_trans_fast(t19);
    xsi_set_current_line(26, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 6440U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t14, t3, t1, 1);
    t5 = (t14 + 12U);
    t21 = *((unsigned int *)t5);
    t27 = (1U * t21);
    t2 = (4U != t27);
    if (t2 == 1)
        goto LAB15;

LAB16:    t7 = (t0 + 4416);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(27, ng0);
    t1 = (t0 + 6524);
    t4 = (t0 + 4480);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast(t4);
    goto LAB11;

LAB13:    xsi_size_not_matching(9U, t21, 0);
    goto LAB14;

LAB15:    xsi_size_not_matching(4U, t27, 0);
    goto LAB16;

LAB17:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 6540);
    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t21 = (8 - 8);
    t27 = (t21 * 1U);
    t28 = (0 + t27);
    t7 = (t8 + t28);
    t12 = ((IEEE_P_2592010699) + 4000);
    t13 = (t17 + 0U);
    t15 = (t13 + 0U);
    *((int *)t15) = 0;
    t15 = (t13 + 4U);
    *((int *)t15) = 0;
    t15 = (t13 + 8U);
    *((int *)t15) = 1;
    t6 = (0 - 0);
    t29 = (t6 * 1);
    t29 = (t29 + 1);
    t15 = (t13 + 12U);
    *((unsigned int *)t15) = t29;
    t15 = (t30 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 8;
    t16 = (t15 + 4U);
    *((int *)t16) = 1;
    t16 = (t15 + 8U);
    *((int *)t16) = -1;
    t20 = (1 - 8);
    t29 = (t20 * -1);
    t29 = (t29 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t29;
    t11 = xsi_base_array_concat(t11, t14, t12, (char)97, t4, t17, (char)97, t7, t30, (char)101);
    t29 = (1U + 8U);
    t9 = (9U != t29);
    if (t9 == 1)
        goto LAB20;

LAB21:    t16 = (t0 + 4352);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    t23 = (t19 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t11, 9U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(32, ng0);
    t1 = (t0 + 6541);
    t4 = (t0 + 4480);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(33, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 6440U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t14, t3, t1, 1);
    t5 = (t14 + 12U);
    t21 = *((unsigned int *)t5);
    t27 = (1U * t21);
    t2 = (4U != t27);
    if (t2 == 1)
        goto LAB22;

LAB23:    t7 = (t0 + 4416);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast(t7);
    goto LAB18;

LAB20:    xsi_size_not_matching(9U, t29, 0);
    goto LAB21;

LAB22:    xsi_size_not_matching(4U, t27, 0);
    goto LAB23;

LAB24:    xsi_size_not_matching(16U, t27, 0);
    goto LAB25;

}

static void work_a_1200803988_0197700266_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(40, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = (0 - 8);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 4544);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 4256);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1200803988_0197700266_p_2(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6440U);
    t3 = (t0 + 6557);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 3;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (3 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = (t0 + 4608);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t15);

LAB2:    t20 = (t0 + 4272);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 4608);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_1200803988_0197700266_init()
{
	static char *pe[] = {(void *)work_a_1200803988_0197700266_p_0,(void *)work_a_1200803988_0197700266_p_1,(void *)work_a_1200803988_0197700266_p_2};
	xsi_register_didat("work_a_1200803988_0197700266", "isim/tb_isim_beh.exe.sim/work/a_1200803988_0197700266.didat");
	xsi_register_executes(pe);
}
