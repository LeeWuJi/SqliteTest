//
//  Popup.m
//  PopupViewStudy
//
//

#import "Popup.h"

@implementation Popup


- (instancetype)initWithTitle:(NSString*)title xuhao:(NSString*)xuhao donghao:(NSString*)donghao danyuan:(NSString*)danyuan fanghao:(NSString*)fanghao huxing:(NSString*)huxing taonei:(NSString*)taonei jianzhumj:(NSString*)jianzhumj SDmianj:(NSString*)SDmianj yuanjia0:(NSString*)yuanjia0 yuanjia1:(NSString*)yuanjia1 difang0:(NSString*)difang0 difang1:(NSString*)difang1 xuanfang0:(NSString*)xuanfang0 xuanfang1:(NSString*)xuanfang1 btnContent:(NSString*)btnContent
{
    self = [super init];
    if (self) {
        // 设置属性
        self.title = title;
        self.xuhao = xuhao;
        self.donghao = donghao;
        self.danyuan = danyuan;
        self.fanghao = fanghao;
        self.huxing = huxing;
        self.taonei = taonei;
        self.jianzhumj = jianzhumj;
        self.SDmianj = SDmianj;
        self.yuanjia0 = yuanjia0;
        self.yuanjia1 = yuanjia1;
        self.difang0 = difang0;
        self.difang1 = difang1;
        self.xuanfang0 = xuanfang0;
        self.xuanfang1 = xuanfang1;
        self.btnContet = btnContent;
    }
    return self;
}

@end
