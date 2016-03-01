//
//  LJRowView.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#define SOLD @"1"
#define NOT_SOLD @"0"

#import "LJRowView.h"
#import "LJColumnView.h"
#import "LJConstant.h"
#import "FangYXX.h"
#import "DzlsInterFace.h"

@interface LJRowView ()
@property int FONT_SIZE;
@property int COLUMN_HEIGHT;
@property int COLUMN_WIDTH;
@property int COLUMN_WIDTH_MARGIN;
@property int COLUMN_HEIGHT_MARGIN;
@end

@implementation LJRowView
//  配置每列宽度后构造Cell（即row对象）
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
            columnWidthList:(NSArray*)columnWidthList{
    //  改变常量在LJConstant里面
    self.FONT_SIZE = [LJConstant getFONT_SIZE];
    self.COLUMN_HEIGHT = [LJConstant getCOLUMN_HEIGHT];
    self.COLUMN_WIDTH = [LJConstant getCOLUMN_WIDTH];
    self.COLUMN_WIDTH_MARGIN = [LJConstant getCOLUMN_WIDTH_MARGIN];
    self.COLUMN_HEIGHT_MARGIN = [LJConstant getCOLUMN_HEIGHT_MARGIN];
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //  记录已经使用过的宽度
        double usedWidth = 0;
        //  构造列
        for(int i = 0; i < columnWidthList.count; i ++){
            //  构造单元格
            LJColumnView *column =[[LJColumnView alloc]initWithFrame:CGRectMake(usedWidth, 0,((NSNumber*)columnWidthList[i]).doubleValue, self.COLUMN_HEIGHT + self.COLUMN_HEIGHT_MARGIN)];
            //  记录已经使用过的宽度
            usedWidth += ((NSNumber*)columnWidthList[i]).doubleValue;
            column.backgroundColor=[UIColor whiteColor];
            column.layer.borderWidth = 0.5;
            [self.contentView addSubview: column];
        }//for
        
        UILabel *vc = [[UILabel alloc]init];
        vc.frame = CGRectMake(0, 0, 4 * self.COLUMN_WIDTH + 10,  self.COLUMN_HEIGHT + self.COLUMN_HEIGHT_MARGIN);
        vc.tag = 10000;
        vc.backgroundColor = [UIColor clearColor];
        vc.text = @"已售";
        [vc setFont:[UIFont fontWithName:@"Helvetica-Bold" size: 14]];
        [vc setTextColor:[UIColor whiteColor]];
        vc.textAlignment = NSTextAlignmentCenter;
        ((LJColumnView*)self.contentView.subviews[10]).backgroundColor = [UIColor colorWithRed:(239)/255.0 green:(8)/255.0 blue:(8)/255.0 alpha:1];
        [((LJColumnView*)self.contentView.subviews[10]) addSubview:vc];
    }
    return self;
}

-(void)setData: (DzlsInterFace_Local_HousingResources*) fyxx{
    ((LJColumnView*)self.contentView.subviews[0]).detail = [[NSString alloc] initWithFormat:@"%d",fyxx.xuHao.intValue];
    ((LJColumnView*)self.contentView.subviews[1]).detail = fyxx.dongHao;
    ((LJColumnView*)self.contentView.subviews[2]).detail = fyxx.danYuan;
    ((LJColumnView*)self.contentView.subviews[3]).detail = fyxx.fangHao;
    ((LJColumnView*)self.contentView.subviews[4]).detail = fyxx.huXing;
    ((LJColumnView*)self.contentView.subviews[5]).detail = fyxx.taoNei;
    fyxx.jianZhuMJ = [NSString stringWithFormat:@"%.2f",[fyxx.jianZhuMJ floatValue]];
    ((LJColumnView*)self.contentView.subviews[6]).detail = fyxx.jianZhuMJ;
    fyxx.shiDeMJ = [NSString stringWithFormat:@"%.2f",[fyxx.shiDeMJ floatValue]];
    ((LJColumnView*)self.contentView.subviews[7]).detail = fyxx.shiDeMJ;
    fyxx.yuanJia0 = [NSString stringWithFormat:@"%.2f",[fyxx.yuanJia0 floatValue]];
    ((LJColumnView*)self.contentView.subviews[8]).detail = fyxx.yuanJia0;
    fyxx.yuanJia1 = [NSString stringWithFormat:@"%.2f",[fyxx.yuanJia1 floatValue]];
    ((LJColumnView*)self.contentView.subviews[9]).detail = fyxx.yuanJia1;
    fyxx.diFangYH0 = [NSString stringWithFormat:@"%.2f",[fyxx.diFangYH0 floatValue]];
    ((LJColumnView*)self.contentView.subviews[10]).detail = fyxx.diFangYH0;
    fyxx.diFangYH0 = [NSString stringWithFormat:@"%.2f",[fyxx.diFangYH0 floatValue]];
    fyxx.diFangYH1 = [NSString stringWithFormat:@"%.2f",[fyxx.diFangYH1 floatValue]];
    ((LJColumnView*)self.contentView.subviews[11]).detail = fyxx.diFangYH1;
    fyxx.zaiYH0 = [NSString stringWithFormat:@"%.2f",[fyxx.zaiYH0 floatValue]];
    ((LJColumnView*)self.contentView.subviews[12]).detail = fyxx.zaiYH0;
    fyxx.zaiYH1 = [NSString stringWithFormat:@"%.2f",[fyxx.zaiYH1 floatValue]];
    ((LJColumnView*)self.contentView.subviews[13]).detail = fyxx.zaiYH1;

    
    
    if ([fyxx.is_sold isEqualToString: SOLD]){
        ((LJColumnView*)self.contentView.subviews[10]).backgroundColor = [UIColor redColor];
        ((LJColumnView*)self.contentView.subviews[10]).frame = CGRectMake(10 * self.COLUMN_WIDTH, 0, 4 * self.COLUMN_WIDTH + 10,  self.COLUMN_HEIGHT + self.COLUMN_HEIGHT_MARGIN);
        
        for (int i = 0; i < ((LJColumnView*)self.contentView.subviews[10]).subviews.count; i++) {
            UIView *view = (LJColumnView*)self.contentView.subviews[10].subviews[i];
            if([view isKindOfClass:[UILabel class]] && view.tag == 10000){
                view.hidden = NO;
            }
        }
        self.contentView.layer.borderWidth = 0;
        ((LJColumnView*)self.contentView.subviews[10]).detail = @" ";
        
        ((LJColumnView*)self.contentView.subviews[11]).hidden = YES;
        ((LJColumnView*)self.contentView.subviews[12]).hidden = YES;
        ((LJColumnView*)self.contentView.subviews[13]).hidden = YES;
    }else{
        for (int i = 0; i < ((LJColumnView*)self.contentView.subviews[10]).subviews.count; i++) {
            UIView *view = (LJColumnView*)self.contentView.subviews[10].subviews[i];
            if([view isKindOfClass:[UILabel class]] && view.tag == 10000){
                view.hidden = YES;
            }
        }

        ((LJColumnView*)self.contentView.subviews[10]).backgroundColor = [UIColor whiteColor];
        ((LJColumnView*)self.contentView.subviews[11]).hidden = NO;
        ((LJColumnView*)self.contentView.subviews[12]).hidden = NO;
        ((LJColumnView*)self.contentView.subviews[13]).hidden = NO;
        
        
    }
}

@end
