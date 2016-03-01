//
//  PopupView.h
//  PopupViewStudy
//
//  Created by caiqiujun on 15/12/29.
//  Copyright © 2015年 caiqiujun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainWindow.h"
#import "ShowDetailView.h"
#import "Popup.h"
#import "ViewController.h"

@interface PopupView : UIView
//@property (nonatomic, strong) MainWindow *mainWindow;
@property (nonatomic, strong) ShowDetailView *showView;
@property (nonatomic, strong) Popup *popup;
@property (nonatomic, strong) ViewController *mainViewController;

- (instancetype)initWithPopup:(Popup*)popup withMainViewController: (ViewController*) viewController;
- (void)hidePopupView:(UITapGestureRecognizer*)gesture;
@end
