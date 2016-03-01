//
//  LJColumnView.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import "LJColumnView.h"
#import "LJConstant.h"

@interface LJColumnView()
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *detailLabel;

@end

@implementation LJColumnView

- (id)initWithFrame:(CGRect)frame{
    int FONT_SIZE = [LJConstant getFONT_SIZE];
    
    self = [super initWithFrame:frame];
    if (self) {
        self.numLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.5)];
        self.numLabel.textAlignment=NSTextAlignmentCenter;
        self.numLabel.center=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.25);
        [self addSubview:self.numLabel];

        self.detailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.5)];
        self.detailLabel.textAlignment=NSTextAlignmentCenter;
        self.detailLabel.font=[UIFont systemFontOfSize:FONT_SIZE];
        self.detailLabel.center=CGPointMake(self.frame.size.width*0.5, self.frame.size.height-self.frame.size.height*0.25);
        [self addSubview:self.detailLabel];
    }
    return self;
}

-(void)setNum:(NSString *)num{
    _num=num;
    self.numLabel.text=num;
    self.numLabel.textAlignment=NSTextAlignmentCenter;
}

-(void)setDetail:(NSString *)detail{
    _detail=detail;
    self.detailLabel.text=detail;
    self.detailLabel.textAlignment=NSTextAlignmentCenter;
    
}
-(void)setHeaderStyle{
    [self.detailLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size: 14]];
    [self.detailLabel setTextColor:[UIColor whiteColor]];
}
@end
