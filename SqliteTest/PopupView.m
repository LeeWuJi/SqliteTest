//
//  PopupView.m
//  PopupViewStudy
//
//  Created by caiqiujun on 15/12/29.
//  Copyright © 2015年 caiqiujun. All rights reserved.
//

#import "PopupView.h"

@implementation PopupView

- (instancetype)initWithPopup:(Popup*)popup withMainViewController: (UIViewController*) viewController
{
    self = [super init];
    if (self) {
        // 设置属性
        self.popup = popup;
        self.mainViewController = viewController;
        
        // 设置背景颜色
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        
        // 添加单击手势
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePopupView:)];
//        self.userInteractionEnabled = YES;
//        [self addGestureRecognizer:gesture];
        
        
        // 增加主窗口
        [self addWindowView];
    }
    return self;
}

-(void)addWindowView {
    // 获取屏幕信息
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat screenWidth = size.width;
    CGFloat screenHeight = size.height;
    CGFloat mainHeight = size.width * 0.5;//弹出view大小
    
    self.showView = [[ShowDetailView alloc]initWithFYXXuHao:self.popup.xuhao.intValue withMainViewController:self.mainViewController];
    self.showView.frame = CGRectMake(screenWidth * 0.15+100, screenHeight * 0.15, screenWidth-500, mainHeight);
    self.showView.layer.cornerRadius = 5;
    self.showView.layer.masksToBounds = YES;
    self.showView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.showView];
}



- (void)hidePopupView:(UITapGestureRecognizer*)gesture {
    [self removeFromSuperview];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 
    
}
*/

@end
