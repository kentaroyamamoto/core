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
static const char *ng0 = "/home/kentaro/core/sender.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );


static void work_a_1955129939_0949684337_p_0(char *t0)
{
    char t32[16];
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
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    unsigned char t20;
    unsigned char t21;
    char *t22;
    unsigned char t23;
    unsigned char t24;
    char *t25;
    unsigned char t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;

LAB0:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4424);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t3 = (t0 + 7073);
    t6 = xsi_mem_cmp(t3, t4, 3U);
    if (t6 == 1)
        goto LAB6;

LAB11:    t7 = (t0 + 7076);
    t9 = xsi_mem_cmp(t7, t4, 3U);
    if (t9 == 1)
        goto LAB7;

LAB12:    t10 = (t0 + 7079);
    t12 = xsi_mem_cmp(t10, t4, 3U);
    if (t12 == 1)
        goto LAB8;

LAB13:    t13 = (t0 + 7082);
    t15 = xsi_mem_cmp(t13, t4, 3U);
    if (t15 == 1)
        goto LAB9;

LAB14:
LAB10:
LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(67, ng0);
    t18 = (t0 + 2472U);
    t19 = *((char **)t18);
    t20 = *((unsigned char *)t19);
    t21 = (t20 == (unsigned char)2);
    if (t21 == 1)
        goto LAB22;

LAB23:    t17 = (unsigned char)0;

LAB24:    if (t17 == 1)
        goto LAB19;

LAB20:    t16 = (unsigned char)0;

LAB21:    if (t16 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 4504);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB17:    goto LAB5;

LAB7:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 4760);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t16 = *((unsigned char *)t3);
    t17 = (t16 == (unsigned char)2);
    if (t17 == 1)
        goto LAB30;

LAB31:    t2 = (unsigned char)0;

LAB32:    if (t2 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 4504);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB28:    goto LAB5;

LAB8:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t16 = *((unsigned char *)t3);
    t17 = (t16 == (unsigned char)2);
    if (t17 == 1)
        goto LAB38;

LAB39:    t2 = (unsigned char)0;

LAB40:    if (t2 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 4504);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB36:    goto LAB5;

LAB9:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t16 = *((unsigned char *)t3);
    t17 = (t16 == (unsigned char)2);
    if (t17 == 1)
        goto LAB46;

LAB47:    t2 = (unsigned char)0;

LAB48:    if (t2 != 0)
        goto LAB43;

LAB45:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 4504);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB44:    goto LAB5;

LAB15:;
LAB16:    xsi_set_current_line(68, ng0);
    t18 = (t0 + 4504);
    t28 = (t18 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = (unsigned char)3;
    xsi_driver_first_trans_fast(t18);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 6920U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t32, t3, t1, 1);
    t5 = (t32 + 12U);
    t33 = *((unsigned int *)t5);
    t34 = (1U * t33);
    t2 = (3U != t34);
    if (t2 == 1)
        goto LAB25;

LAB26:    t7 = (t0 + 4568);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 3U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t33 = (31 - 31);
    t34 = (t33 * 1U);
    t35 = (0 + t34);
    t1 = (t3 + t35);
    t4 = (t0 + 4632);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t33 = (31 - 7);
    t34 = (t33 * 1U);
    t35 = (0 + t34);
    t1 = (t3 + t35);
    t4 = (t0 + 4696);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 4760);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB17;

LAB19:    t18 = (t0 + 2632U);
    t25 = *((char **)t18);
    t26 = *((unsigned char *)t25);
    t27 = (t26 == (unsigned char)2);
    t16 = t27;
    goto LAB21;

LAB22:    t18 = (t0 + 2792U);
    t22 = *((char **)t18);
    t23 = *((unsigned char *)t22);
    t24 = (t23 == (unsigned char)2);
    t17 = t24;
    goto LAB24;

LAB25:    xsi_size_not_matching(3U, t34, 0);
    goto LAB26;

LAB27:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 4504);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 6920U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t32, t3, t1, 1);
    t5 = (t32 + 12U);
    t33 = *((unsigned int *)t5);
    t34 = (1U * t33);
    t2 = (3U != t34);
    if (t2 == 1)
        goto LAB33;

LAB34:    t7 = (t0 + 4568);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 3U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t33 = (31 - 15);
    t34 = (t33 * 1U);
    t35 = (0 + t34);
    t1 = (t3 + t35);
    t4 = (t0 + 4696);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    goto LAB28;

LAB30:    t1 = (t0 + 2632U);
    t4 = *((char **)t1);
    t20 = *((unsigned char *)t4);
    t21 = (t20 == (unsigned char)2);
    t2 = t21;
    goto LAB32;

LAB33:    xsi_size_not_matching(3U, t34, 0);
    goto LAB34;

LAB35:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 4504);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 6920U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t32, t3, t1, 1);
    t5 = (t32 + 12U);
    t33 = *((unsigned int *)t5);
    t34 = (1U * t33);
    t2 = (3U != t34);
    if (t2 == 1)
        goto LAB41;

LAB42:    t7 = (t0 + 4568);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 3U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t33 = (31 - 23);
    t34 = (t33 * 1U);
    t35 = (0 + t34);
    t1 = (t3 + t35);
    t4 = (t0 + 4696);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    goto LAB36;

LAB38:    t1 = (t0 + 2632U);
    t4 = *((char **)t1);
    t20 = *((unsigned char *)t4);
    t21 = (t20 == (unsigned char)2);
    t2 = t21;
    goto LAB40;

LAB41:    xsi_size_not_matching(3U, t34, 0);
    goto LAB42;

LAB43:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 4504);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 7085);
    t4 = (t0 + 4568);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t33 = (31 - 31);
    t34 = (t33 * 1U);
    t35 = (0 + t34);
    t1 = (t3 + t35);
    t4 = (t0 + 4696);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    goto LAB44;

LAB46:    t1 = (t0 + 2632U);
    t4 = *((char **)t1);
    t20 = *((unsigned char *)t4);
    t21 = (t20 == (unsigned char)2);
    t2 = t21;
    goto LAB48;

}


extern void work_a_1955129939_0949684337_init()
{
	static char *pe[] = {(void *)work_a_1955129939_0949684337_p_0};
	xsi_register_didat("work_a_1955129939_0949684337", "isim/tb_isim_beh.exe.sim/work/a_1955129939_0949684337.didat");
	xsi_register_executes(pe);
}
