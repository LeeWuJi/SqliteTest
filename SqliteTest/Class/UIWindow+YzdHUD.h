//
//  UIWindow+YzdHUD.h
//  YzdHUD
//
//

#import <UIKit/UIKit.h>

#pragma mark - 提示框类型
typedef NS_ENUM(NSUInteger, showHUDType) {
    ShowLoading = 0,//加载中
    ShowPhotoYes,//对号
    ShowPhotoNo,//叉子
    ShowDismiss,//删除
};

typedef void (^AnimationBlock)(UIView *animationView);

@interface UIWindow (YzdHUD)

-(void)showHUDWithText:(NSString *)text Type:(showHUDType)type Enabled:(BOOL)enabled;

-(void)showHUDWithText:(NSString *)text Type:(showHUDType)type Enabled:(BOOL)enabled Bounds:(CGRect)bounds Center:(CGPoint)center BackgroundAlpha:(CGFloat)backgroundAlpha ComeTime:(CGFloat)comeTime StayTime:(CGFloat)stayTime GoTime:(CGFloat)goTime;

@end












