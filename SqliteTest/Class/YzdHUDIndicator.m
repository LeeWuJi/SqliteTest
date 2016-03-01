//
//  YzdHUDIndicator.m
//  YzdHUD
//
//

#import "YzdHUDIndicator.h"

static YzdHUDIndicator *_shareHUDView = nil;
@implementation YzdHUDIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(YzdHUDIndicator *)shareHUDView{
    if (!_shareHUDView) {
        _shareHUDView = [[YzdHUDIndicator alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    }
    return _shareHUDView;
}

@end
