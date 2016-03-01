//
//  FangYXX.h
//  SqliteTest
//
//  Created by LeeWuji on 16/2/24.
//  Copyright © 2016年 ysj. All rights reserved.
//  房源信息 实体类

#import <Foundation/Foundation.h>



@interface FangYXX : NSObject
    @property(nonatomic,assign)int xuHao;               //序号√

    @property(nonatomic,strong)NSString *dongHao;       //栋号√
    @property(nonatomic,strong)NSString *danYuan;       //单元√
    @property(nonatomic,strong)NSString *louCeng;       //楼层√
    @property(nonatomic,strong)NSString *fangHao;       //房号√
    @property(nonatomic,strong)NSString *huXing;        //户型√

    @property(nonatomic,strong)NSString *taoNei;        //套内√
    @property(nonatomic,strong)NSString *jianZhuMJ;     //建筑面积√

    @property(nonatomic,strong)NSString *tuanGouDJ;     //团购单价√
    @property(nonatomic,strong)NSString *tuanGouDJ105;  //增加5%单价√

    @property(nonatomic,strong)NSString *tuanGouZJ;     //团购总价√
    @property(nonatomic,strong)NSString *tuanGouZJ105;  //增加5%总价√

    @property(nonatomic,strong)NSString *xuanFangYH0;   //选房再优惠5%√
    @property(nonatomic,strong)NSString *xuanFangYH1;   //选房再优惠5%√

    @property(nonatomic,strong)NSString *shiChangYH0;   //市场及工程优惠10%√
    @property(nonatomic,strong)NSString *shiChangYH1;   //市场及工程优惠10%√

    @property(nonatomic,strong)NSString *shiDeMJ;       //实得面积√

    @property(nonatomic,strong)NSString *yuanJia0;      //原价√
    @property(nonatomic,strong)NSString *yuanJia1;      //原价√
    
    @property(nonatomic,strong)NSString *diFangYH0;     //市场客户及工程抵房优惠10%√
    @property(nonatomic,strong)NSString *diFangYH1;     //市场客户及工程抵房优惠10%√
    @property(nonatomic,strong)NSString *zaiYH0;        //市场客户及工程选房再优惠5%√
    @property(nonatomic,strong)NSString *zaiYH1;        //市场客户及工程选房再优惠5%√

-(FangYXX *)initWithSetXuHao:(int)xuHao andWithSetDongHao:(NSString*)dongHao andWithSetDanYuan:(NSString *)danYuan andWithSetLouCeng:(NSString *)louCeng andWithSetFangHao:(NSString *)fangHao andWithSetHuXing:(NSString *)huXing andWithSetTaoNei:(NSString*)taoNei andWithSetJianZhuMJ:(NSString*)jianZhuMJ andWithSetTuanGouDJ:(NSString*)tuanGouDJ andWithSetTuanGouDJ105:(NSString*)tuanGouDJ105 andWithSetTuanGouZJ:(NSString*)tuanGouZJ andWithSetTuanGouZJ105:(NSString*)tuanGouZJ105 andWithSetXuanFangYH0:(NSString*)xuanFangYH0 andWithSetXuanFangYH1:(NSString*)xuanFangYH1 andWithSetShiChangYH0:(NSString*)shiChangYH0 andWithSetShiChangYH1:(NSString*)shiChangYH1 andWithSetShiDeMJ:(NSString*)shiDeMJ andWithSetYuanJia0:(NSString*)yuanJia0 andWithSetYuanJia1:(NSString*)yuanJia1 andWithSetDiFangYH0:(NSString*)diFangYH0 andWithSetDiFangYH1:(NSString*)diFangYH1 andWithSetZaiYH0:(NSString*)zaiYH0 andWithSetZaiYH1:(NSString*)zaiYH1;

-(void)test;

@end
