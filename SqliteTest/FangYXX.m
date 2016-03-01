//
//  FangYXX.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/24.
//  Copyright © 2016年 ysj. All rights reserved.
//

#import "FangYXX.h"

@implementation FangYXX
-(FangYXX *)initWithSetXuHao:(int)xuHao andWithSetDongHao:(NSString*)dongHao andWithSetDanYuan:(NSString *)danYuan andWithSetLouCeng:(NSString *)louCeng andWithSetFangHao:(NSString *)fangHao andWithSetHuXing:(NSString *)huXing andWithSetTaoNei:(NSString*)taoNei andWithSetJianZhuMJ:(NSString*)jianZhuMJ andWithSetTuanGouDJ:(NSString*)tuanGouDJ andWithSetTuanGouDJ105:(NSString*)tuanGouDJ105 andWithSetTuanGouZJ:(NSString*)tuanGouZJ andWithSetTuanGouZJ105:(NSString*)tuanGouZJ105 andWithSetXuanFangYH0:(NSString*)xuanFangYH0 andWithSetXuanFangYH1:(NSString*)xuanFangYH1 andWithSetShiChangYH0:(NSString*)shiChangYH0 andWithSetShiChangYH1:(NSString*)shiChangYH1 andWithSetShiDeMJ:(NSString*)shiDeMJ andWithSetYuanJia0:(NSString*)yuanJia0 andWithSetYuanJia1:(NSString*)yuanJia1 andWithSetDiFangYH0:(NSString*)diFangYH0 andWithSetDiFangYH1:(NSString*)diFangYH1 andWithSetZaiYH0:(NSString*)zaiYH0 andWithSetZaiYH1:(NSString*)zaiYH1{

        self = [super init];
        if (self) {
            self.xuHao = xuHao;
            self.dongHao = dongHao;
            self.danYuan = danYuan;
            self.louCeng = louCeng;
            self.fangHao = fangHao;
            self.huXing = huXing;
            self.taoNei = taoNei;
            self.jianZhuMJ = jianZhuMJ;
            self.tuanGouDJ = tuanGouDJ;
            self.tuanGouDJ105 = tuanGouDJ105;
            self.tuanGouZJ = tuanGouZJ;
            self.tuanGouZJ105 = tuanGouZJ105;
            self.xuanFangYH0 = xuanFangYH0;
            self.xuanFangYH1 = xuanFangYH1;
            self.shiChangYH0 = shiChangYH0;
            self.shiChangYH1 = shiChangYH1;
            self.shiDeMJ = shiDeMJ;
            self.yuanJia0 = yuanJia0;
            self.yuanJia1 = yuanJia1;
            self.diFangYH0 = diFangYH0;
            self.diFangYH1 = diFangYH1;
            self.zaiYH0 = zaiYH0;
            self.zaiYH1 = zaiYH1;
            
        }
        return self;

}
-(void)test{
    NSLog(@"xuHao:%d dongHao:%@ danYuan:%@ louCeng:%@",self.xuHao,self.dongHao,self.danYuan,self.louCeng);
}

@end
