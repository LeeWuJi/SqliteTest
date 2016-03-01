//
//  LJTableHeadView.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import "LJTableHeadView.h"
#import "LJColumnView.h"
#import "LJConstant.h"
#import "LJTools.h"

@interface LJTableHeadView()
@property int FONT_SIZE;
@property int COLUMN_HEIGHT;
@property int COLUMN_WIDTH_MARGIN;
@property int COLUMN_HEIGHT_MARGIN;
@end

@implementation LJTableHeadView

- (id)initWithFrame:(CGRect)frame columnWidthList:(NSArray*)columnWidthList columnTitleList:(NSArray*) columnTitleList
{
    if (columnWidthList.count != columnTitleList.count) {
        NSLog(@"参数列表columnWidthList与columnTitleList长度不一致");
        return nil;
    }
    
    self = [super initWithFrame:frame];
    if (self) {
        //  改变常量在LJConstant里面
        self.FONT_SIZE = [LJConstant getFONT_SIZE];
        self.COLUMN_HEIGHT = [LJConstant getCOLUMN_HEIGHT];
        self.COLUMN_WIDTH_MARGIN = [LJConstant getCOLUMN_WIDTH_MARGIN];
        self.COLUMN_HEIGHT_MARGIN = [LJConstant getCOLUMN_HEIGHT_MARGIN];
        
        //  记录已经使用过的宽度
        double usedWidth = 0;
        //  构造列
        for(int i = 0; i < columnWidthList.count; i ++){
            //  构造单元格
            LJColumnView *column =[[LJColumnView alloc]initWithFrame:CGRectMake(usedWidth, 0,((NSNumber*)columnWidthList[i]).doubleValue, self.COLUMN_HEIGHT + self.COLUMN_HEIGHT_MARGIN)];
            //  记录已经使用过的宽度
            usedWidth += ((NSNumber*)columnWidthList[i]).doubleValue;
            column.backgroundColor = [UIColor colorWithRed:(8)/255.0 green:(89)/255.0 blue:(165)/255.0 alpha:1];
            column.layer.borderWidth = 0.5;
            [column setDetail: columnTitleList[i]];
            [column setHeaderStyle];
            [self addSubview: column];
        }//for

    }
    return self;
}

@end
