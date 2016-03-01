//
//  Popup.h
//  PopupViewStudy
//
//

#import <Foundation/Foundation.h>

@interface Popup : NSObject

// 标题
@property (nonatomic, strong)NSString *title;
// 消息内容
@property (nonatomic, strong)NSString *xuhao;
@property (nonatomic, strong)NSString *donghao;
@property (nonatomic, strong)NSString *danyuan;
@property (nonatomic, strong)NSString *fanghao;
@property (nonatomic, strong)NSString *huxing;
@property (nonatomic, strong)NSString *taonei;
@property (nonatomic, strong)NSString *jianzhumj;
@property (nonatomic, strong)NSString *SDmianj;
@property (nonatomic, strong)NSString *yuanjia0;
@property (nonatomic, strong)NSString *yuanjia1;
@property (nonatomic, strong)NSString *difang0;
@property (nonatomic, strong)NSString *difang1;
@property (nonatomic, strong)NSString *xuanfang0;
@property (nonatomic, strong)NSString *xuanfang1;
// 确认按钮内容
@property (nonatomic, strong)NSString *btnContet;

- (instancetype)initWithTitle:(NSString*)title xuhao:(NSString*)xuhao donghao:(NSString*)donghao danyuan:(NSString*)danyuan fanghao:(NSString*)fanghao huxing:(NSString*)huxing taonei:(NSString*)taonei jianzhumj:(NSString*)jianzhumj SDmianj:(NSString*)SDmianj yuanjia0:(NSString*)yuanjia0 yuanjia1:(NSString*)yuanjia1 difang0:(NSString*)difang0 difang1:(NSString*)difang1 xuanfang0:(NSString*)xuanfang0 xuanfang1:(NSString*)xuanfang1 btnContent:(NSString*)btnContent;

@end
