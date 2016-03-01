//
//  YzdHUDImageView.m
//  YzdHUD
//
//

#import "YzdHUDImageView.h"

static YzdHUDImageView *_shareHUDView = nil;
@implementation YzdHUDImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(YzdHUDImageView *)shareHUDView{
    if (!_shareHUDView) {
        _shareHUDView = [[YzdHUDImageView alloc] init];
        _shareHUDView.alpha = 0;
    }
    return _shareHUDView;
}


@end
