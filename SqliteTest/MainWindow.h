//
//  MainWindow.h
//  PopupViewStudy
//
//  Created by caiqiujun on 15/12/29.
//  Copyright © 2015年 caiqiujun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Popup.h"

@interface MainWindow : UIView
// 属性
@property (nonatomic, strong) Popup *popup;
// 主题颜色
@property (nonatomic, strong)UIColor *themeColor;
// 进度
@property (nonatomic, assign)CGFloat progress;

- (instancetype)initWithPopup:(Popup*)popup;
@end
