//
//  YzdHUDLabel.m
//  YzdHUD
//
//

#import "YzdHUDLabel.h"

static YzdHUDLabel *_shareHUDView = nil;
@implementation YzdHUDLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(YzdHUDLabel *)shareHUDView{
    if (!_shareHUDView) {
        _shareHUDView = [[YzdHUDLabel alloc] init];
        _shareHUDView.numberOfLines = 0;
        _shareHUDView.alpha = 0;
        _shareHUDView.textAlignment = NSTextAlignmentCenter;
        _shareHUDView.backgroundColor = [UIColor clearColor];
        _shareHUDView.textColor = [UIColor whiteColor];

    }
    return _shareHUDView;
}
@end
