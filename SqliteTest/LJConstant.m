//
//  LJConstant.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#define FONT_SIZE 12
#define COLUMN_HEIGHT 40
#define COLUMN_WIDTH_MARGIN 0
#define COLUMN_HEIGHT_MARGIN 4

#define SCREEN_WIDTH 1024
#define SCREEN_HEIGHT 768
#define SCREENFRAME CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT)



#import "LJConstant.h"
@interface LJConstant ()

@end

@implementation LJConstant
+(int) getFONT_SIZE{
    return FONT_SIZE;
}

+(double) getCOLUMN_WIDTH{
    //return (SCREEN_WIDTH - 20) / 14;
    return 71; // 左右各边距10 13个单元格各71 最后一个单元格81 共 10*2 + 71*13 + 81 = 1024
}

+(int) getCOLUMN_HEIGHT{
    return COLUMN_HEIGHT;
}

+(int) getCOLUMN_WIDTH_MARGIN{
    return COLUMN_WIDTH_MARGIN;
}

+(int) getCOLUMN_HEIGHT_MARGIN{
    return COLUMN_HEIGHT_MARGIN;
}

+(int) getSCREEN_WIDTH{
    return SCREEN_WIDTH;
}

+(int) getSCREEN_HEIGHT{
    return SCREEN_HEIGHT;
}

@end
