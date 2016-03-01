//
//  MainWindow.h
//  PopupViewStudy
//
//  Created by caiqiujun on 15/12/29.
//  Copyright © 2015年 caiqiujun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Popup.h"
#import "ViewController.h"

@interface ShowDetailView: UIView
// 主题颜色
@property (nonatomic, strong)UIColor *themeColor;
// 进度
@property (nonatomic, assign)CGFloat progress;
//  主控制器
@property (nonatomic, strong) ViewController *mainViewController;

- (instancetype)initWithFYXXuHao:(int)xuHao withMainViewController: (ViewController*) viewController;
@end
