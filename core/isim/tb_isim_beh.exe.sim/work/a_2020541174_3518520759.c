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
static const char *ng0 = "/home/kentaro/core/recv_min.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );
char *ieee_p_3620187407_sub_2255506239096238868_3965413181(char *, char *, char *, char *, int );
int ieee_p_3620187407_sub_5109402382352621412_3965413181(char *, char *, char *);
unsigned char ieee_p_3620187407_sub_970019341842465249_3965413181(char *, char *, char *, int );


static void work_a_2020541174_3518520759_p_0(char *t0)
{
    char t21[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    int t12;
    char *t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t22;
    unsigned int t23;
    unsigned char t24;
    unsigned char t25;
    unsigned int t26;

LAB0:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4024);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(28, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t3 = (t0 + 4104);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 6551);
    t10 = xsi_mem_cmp(t1, t3, 4U);
    if (t10 == 1)
        goto LAB6;

LAB11:    t6 = (t0 + 6555);
    t11 = xsi_mem_cmp(t6, t3, 4U);
    if (t11 == 1)
        goto LAB7;

LAB12:    t8 = (t0 + 6559);
    t12 = xsi_mem_cmp(t8, t3, 4U);
    if (t12 == 1)
        goto LAB8;

LAB13:    t13 = (t0 + 6563);
    t15 = xsi_mem_cmp(t13, t3, 4U);
    if (t15 == 1)
        goto LAB9;

LAB14:
LAB10:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 6440U);
    t2 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t3, t1, 0);
    if (t2 != 0)
        goto LAB38;

LAB40:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 6440U);
    t4 = ieee_p_3620187407_sub_2255506239096238868_3965413181(IEEE_P_3620187407, t21, t3, t1, 1);
    t6 = (t21 + 12U);
    t22 = *((unsigned int *)t6);
    t23 = (1U * t22);
    t2 = (16U != t23);
    if (t2 == 1)
        goto LAB43;

LAB44:    t7 = (t0 + 4360);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 16U);
    xsi_driver_first_trans_fast(t7);

LAB39:
LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(31, ng0);
    t16 = (t0 + 4168);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t16);
    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB5;

LAB7:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 6424U);
    t2 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t3, t1, 0);
    if (t2 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 6424U);
    t4 = ieee_p_3620187407_sub_2255506239096238868_3965413181(IEEE_P_3620187407, t21, t3, t1, 1);
    t6 = (t21 + 12U);
    t22 = *((unsigned int *)t6);
    t23 = (1U * t22);
    t2 = (12U != t23);
    if (t2 == 1)
        goto LAB29;

LAB30:    t7 = (t0 + 4296);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 12U);
    xsi_driver_first_trans_fast(t7);

LAB22:    goto LAB5;

LAB8:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 4168);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 6408U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t21, t3, t1, 1);
    t6 = (t21 + 12U);
    t22 = *((unsigned int *)t6);
    t23 = (1U * t22);
    t2 = (4U != t23);
    if (t2 == 1)
        goto LAB31;

LAB32:    t7 = (t0 + 4232);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 4U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 6599);
    t4 = (t0 + 4360);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 4424);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB9:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 4168);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 6440U);
    t2 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t3, t1, 0);
    if (t2 != 0)
        goto LAB33;

LAB35:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 6440U);
    t4 = ieee_p_3620187407_sub_2255506239096238868_3965413181(IEEE_P_3620187407, t21, t3, t1, 1);
    t6 = (t21 + 12U);
    t22 = *((unsigned int *)t6);
    t23 = (1U * t22);
    t2 = (16U != t23);
    if (t2 == 1)
        goto LAB36;

LAB37:    t7 = (t0 + 4360);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 16U);
    xsi_driver_first_trans_fast(t7);

LAB34:    goto LAB5;

LAB15:;
LAB16:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 6408U);
    t6 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t21, t4, t1, 1);
    t7 = (t21 + 12U);
    t22 = *((unsigned int *)t7);
    t23 = (1U * t22);
    t24 = (4U != t23);
    if (t24 == 1)
        goto LAB19;

LAB20:    t8 = (t0 + 4232);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    t14 = (t13 + 56U);
    t16 = *((char **)t14);
    memcpy(t16, t6, 4U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 6567);
    t4 = (t0 + 4296);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 12U);
    xsi_driver_first_trans_fast(t4);
    goto LAB17;

LAB19:    xsi_size_not_matching(4U, t23, 0);
    goto LAB20;

LAB21:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1832U);
    t6 = *((char **)t4);
    t5 = *((unsigned char *)t6);
    t24 = (t5 == (unsigned char)2);
    if (t24 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 6595);
    t4 = (t0 + 4232);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast(t4);

LAB25:    goto LAB22;

LAB24:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 1672U);
    t7 = *((char **)t4);
    t4 = (t0 + 6408U);
    t8 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t21, t7, t4, 1);
    t9 = (t21 + 12U);
    t22 = *((unsigned int *)t9);
    t23 = (1U * t22);
    t25 = (4U != t23);
    if (t25 == 1)
        goto LAB27;

LAB28:    t13 = (t0 + 4232);
    t14 = (t13 + 56U);
    t16 = *((char **)t14);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t8, 4U);
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(40, ng0);
    t1 = (t0 + 6579);
    t4 = (t0 + 4360);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t4);
    goto LAB25;

LAB27:    xsi_size_not_matching(4U, t23, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(12U, t23, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(4U, t23, 0);
    goto LAB32;

LAB33:    xsi_set_current_line(55, ng0);
    t4 = (t0 + 6615);
    t7 = (t0 + 4232);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 4U);
    xsi_driver_first_trans_fast(t7);
    goto LAB34;

LAB36:    xsi_size_not_matching(16U, t23, 0);
    goto LAB37;

LAB38:    xsi_set_current_line(61, ng0);
    t4 = (t0 + 1832U);
    t6 = *((char **)t4);
    t5 = *((unsigned char *)t6);
    t4 = (t0 + 1672U);
    t7 = *((char **)t4);
    t4 = (t0 + 6408U);
    t10 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t7, t4);
    t11 = (t10 - 7);
    t22 = (t11 * -1);
    t23 = (1 * t22);
    t26 = (0U + t23);
    t8 = (t0 + 4488);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    t14 = (t13 + 56U);
    t16 = *((char **)t14);
    *((unsigned char *)t16) = t5;
    xsi_driver_first_trans_delta(t8, t26, 1, 0LL);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 6408U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t21, t3, t1, 1);
    t6 = (t21 + 12U);
    t22 = *((unsigned int *)t6);
    t23 = (1U * t22);
    t2 = (4U != t23);
    if (t2 == 1)
        goto LAB41;

LAB42:    t7 = (t0 + 4232);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 4U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 6619);
    t4 = (t0 + 4360);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t4);
    goto LAB39;

LAB41:    xsi_size_not_matching(4U, t23, 0);
    goto LAB42;

LAB43:    xsi_size_not_matching(16U, t23, 0);
    goto LAB44;

}


extern void work_a_2020541174_3518520759_init()
{
	static char *pe[] = {(void *)work_a_2020541174_3518520759_p_0};
	xsi_register_didat("work_a_2020541174_3518520759", "isim/tb_isim_beh.exe.sim/work/a_2020541174_3518520759.didat");
	xsi_register_executes(pe);
}
