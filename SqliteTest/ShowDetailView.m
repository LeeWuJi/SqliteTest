//
//  MainWindow.m
//  PopupViewStudy
//
//
#define SOLD @"1"
#define NOT_SOLD @"0"

#import "ShowDetailView.h"
#import "DzlsInterFaceManager.h"
#import "DzlsInterFace.h"
#import "PopupView.h"
#import "ViewController.h"
#import "UIWindow+YzdHUD.h"


@interface ShowDetailView () <DzlsInterFaceSoap12BindingResponseDelegate>
// 属性
@property(nonatomic, strong) DzlsInterFace_Local_HousingResources *fyxx;
@property int xuHao;

@property(nonatomic, strong) UILabel *msgTextView;

@property(nonatomic, strong) UILabel *donghao;
@property(nonatomic, strong) UILabel *danyuan;
@property(nonatomic, strong) UILabel *fanghao;
@property(nonatomic, strong) UILabel *huxing;
@property(nonatomic, strong) UILabel *taonei;
@property(nonatomic, strong) UILabel *jianzhumj;
@property(nonatomic, strong) UILabel *SDmianj;
@property(nonatomic, strong) UILabel *yuanjia0;
@property(nonatomic, strong) UILabel *yuanjia1;
@property(nonatomic, strong) UILabel *difang0;
@property(nonatomic, strong) UILabel *difang1;
@property(nonatomic, strong) UILabel *xuanfang0;
@property(nonatomic, strong) UILabel *xuanfang1;

@property(nonatomic, strong) UILabel *difang2;
@property(nonatomic, strong) UILabel *zaixuan2;

@property(nonatomic, strong)UIButton *btn1;
@property(nonatomic, strong)UIButton *btnQX;

@property(nonatomic, strong)UIImageView *imageV;


@end


@implementation ShowDetailView

- (instancetype)initWithFYXXuHao:(int)xuHao withMainViewController: (ViewController*) viewController
{
    self = [super init];
    if (self) {
        self.xuHao = xuHao;
        self.mainViewController = viewController;
        
        // 获取屏幕信息
        CGRect rect = [[UIScreen mainScreen] bounds];
        CGSize size = rect.size;
        CGFloat screenWidth = size.width;
        CGFloat mainWidth = screenWidth * 0.8;
        NSLog(@"------%f",mainWidth);
        
        self.progress = 0;
        self.themeColor = [UIColor colorWithRed:239/255.0 green:8/255.0 blue:8/255.0 alpha:1];
        self.clipsToBounds = YES;// 如果子视图的范围超出了父视图的边界，超出的部分就会被裁剪掉。
        
        DzlsInterFaceManager *manager = [[DzlsInterFaceManager alloc]init];
        //DzlsInterFace_Local_HousingResources *fyxx = [manager getModel:[NSNumber numberWithInt: xuHao]];  //syn
        
        //  asyn
        DzlsInterFaceSoap12Binding *binding = [manager defaultBinding];
        DzlsInterFace_GetModel *parameters =[[DzlsInterFace_GetModel alloc]init];
        // 设置传入服务参数
        parameters.xuhao = [NSString stringWithFormat:@"%d", xuHao];
        [binding GetModelAsyncUsingParameters:parameters delegate:self];
        
        
        
        
        
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mainWidth * 0.64, mainWidth * 0.12)];
       // titleLabel.center = CGPointMake(100, 20);
        titleLabel.text = @"房屋信息";
        titleLabel.backgroundColor = [UIColor colorWithRed:(90)/255.0 green:(146)/255.0 blue:(173)/255.0 alpha:1];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:titleLabel];
        
        UILabel *xuahao2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
        xuahao2.text = @"序号:";
        xuahao2.font = [UIFont systemFontOfSize:14];
        [self addSubview:xuahao2];
        UILabel *donghao2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 102, 40, 40)];
        donghao2.text = @"栋号:";
        donghao2.font = [UIFont systemFontOfSize:14];
        donghao2.textColor = [UIColor grayColor];
        [self addSubview:donghao2];
        UILabel *danyuan2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 142, 40, 40)];
        danyuan2.text = @"单元:";
        danyuan2.font = [UIFont systemFontOfSize:14];
        danyuan2.textColor = [UIColor grayColor];
        [self addSubview:danyuan2];
        UILabel *fanghao2 = [[UILabel alloc] initWithFrame:CGRectMake(250, 142, 40, 40)];
        fanghao2.text = @"房号:";
        fanghao2.font = [UIFont systemFontOfSize:14];
        fanghao2.textColor = [UIColor grayColor];
        [self addSubview:fanghao2];
        UILabel *huxing2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 182, 40, 40)];
        huxing2.text = @"户型:";
        huxing2.font = [UIFont systemFontOfSize:14];
        huxing2.textColor = [UIColor grayColor];
        [self addSubview:huxing2];
        UILabel *taonei2 = [[UILabel alloc] initWithFrame:CGRectMake(250, 182, 40, 40)];
        taonei2.text = @"套内:";
        taonei2.font = [UIFont systemFontOfSize:14];
        taonei2.textColor = [UIColor grayColor];
        [self addSubview:taonei2];
        UILabel *jiazhumj2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 222, 100, 40)];
        jiazhumj2.text = @"建筑面积(m²):";
        jiazhumj2.font = [UIFont systemFontOfSize:14];
        jiazhumj2.textColor = [UIColor grayColor];
        [self addSubview:jiazhumj2];
        UILabel *SDmianj2 = [[UILabel alloc] initWithFrame:CGRectMake(250, 222, 100, 40)];
        SDmianj2.text = @"实得面积(m²):";
        SDmianj2.font = [UIFont systemFontOfSize:14];
        SDmianj2.textColor = [UIColor grayColor];
        [self addSubview:SDmianj2];
        UILabel *yuanjia2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 262, 60, 40)];
        yuanjia2.text = @"原价(元):";
        yuanjia2.font = [UIFont systemFontOfSize:14];
        yuanjia2.textColor = [UIColor grayColor];
        [self addSubview:yuanjia2];
        self.difang2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 302, 140, 40)];
        self.difang2.text = @"工程抵房优惠10%(元):";
        self.difang2.font = [UIFont systemFontOfSize:14];
        self.difang2.textColor = [UIColor grayColor];
        [self addSubview:self.difang2];
        self.zaixuan2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 342, 150, 40)];
        self.zaixuan2.text = @"工程选房再优惠5%(元):";
        self.zaixuan2.font = [UIFont systemFontOfSize:14];
        self.zaixuan2.textColor = [UIColor grayColor];
        [self addSubview:self.zaixuan2];

        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(-150, 472, mainWidth, 40)];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:150/255.0 blue:24/255.0 alpha:1];
        [btn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:255/255.0 green:150/255.0 blue:24/255.0 alpha:1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(myButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        
        self.msgTextView = [[UILabel alloc] initWithFrame:CGRectMake(42, 0, 100, 40)];
        self.msgTextView.text = [NSString stringWithFormat:@"%d",xuHao];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineSpacing = 10.f;
        
        self.donghao = [[UILabel alloc] initWithFrame:CGRectMake(85, 102, 100, 40)];
        self.danyuan = [[UILabel alloc] initWithFrame:CGRectMake(85, 142, 100, 40)];
        self.fanghao = [[UILabel alloc] initWithFrame:CGRectMake(290, 142, 100, 40)];
        self.huxing = [[UILabel alloc] initWithFrame:CGRectMake(85, 182, 100, 40)];
        self.taonei = [[UILabel alloc] initWithFrame:CGRectMake(290, 182, 100, 40)];
        self.jianzhumj = [[UILabel alloc] initWithFrame:CGRectMake(130, 222, 100, 40)];
        self.SDmianj = [[UILabel alloc] initWithFrame:CGRectMake(340, 222, 100, 40)];
        self.yuanjia0 = [[UILabel alloc] initWithFrame:CGRectMake(125, 260, 180, 40)];
        self.yuanjia1 = [[UILabel alloc] initWithFrame:CGRectMake(225, 260, 180, 40)];
        self.difang0 = [[UILabel alloc] initWithFrame:CGRectMake(195, 300, 180, 40)];
        self.difang1 = [[UILabel alloc] initWithFrame:CGRectMake(295, 300, 180, 40)];
        self.xuanfang0 = [[UILabel alloc] initWithFrame:CGRectMake(195, 340, 180, 40)];
        self.xuanfang1 = [[UILabel alloc] initWithFrame:CGRectMake(295, 340, 180, 40)];
        paragraphStyle.alignment = NSTextAlignmentJustified;
        
//        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12], NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5 alpha:1]};
//        msgTextView.text = [UILabel alloc]initWithString: [NSString stringWithFormat:@"%d",fyxx.xuHao.intValue];
        
        self.imageV = [[UIImageView alloc]init];
        self.imageV.image = [UIImage imageNamed:@"soujin.png"];
        self.imageV.frame = CGRectMake(mainWidth * 0.3 - 60, 300, 160, 160);
        self.imageV.hidden = YES;
        [self addSubview:self.imageV];
        
        // 设置不可编辑
//        [msgTextView setEditable:NO];
//        [donghao setEditable:NO];
//        [danyuan setEditable:NO];
//        [huxing setEditable:NO];
//        [fanghao setEditable:NO];
//        [taonei setEditable:NO];
//        [jianzhumj setEditable:NO];
//        [SDmianj setEditable:NO];
//        [yuanjia1 setEditable:NO];
//        [yuanjia0 setEditable:NO];
//        [difang0 setEditable:NO];
//        [difang1 setEditable:NO];
//        [xuanfang0 setEditable:NO];
//        [xuanfang1 setEditable:NO];
        
        [self addSubview:self.msgTextView];
        [self addSubview:self.donghao];
        [self addSubview:self.danyuan];
        [self addSubview:self.huxing];
        [self addSubview:self.fanghao];
        [self addSubview:self.taonei];
        [self addSubview:self.jianzhumj];
        [self addSubview:self.SDmianj];
        [self addSubview:self.yuanjia0];
        [self addSubview:self.yuanjia1];
        [self addSubview:self.difang0];
        [self addSubview:self.difang1];
        [self addSubview:self.xuanfang0];
        [self addSubview:self.xuanfang1];
        
    }
    return self;
}

#pragma webservie
- (void) operation:(DzlsInterFaceSoap12BindingOperation *)operation completedWithResponse:(DzlsInterFaceSoap12BindingResponse *)response{
    
    if (response.error != nil) {
        //  提示网络错误
        return;
    }
    
    for(id mine in response.bodyParts){
        if([mine isKindOfClass:[DzlsInterFace_GetModelResponse class]]){
            //  类型转换
            DzlsInterFace_GetModelResponse *resp = (DzlsInterFace_GetModelResponse*)mine;
            //  【方法】Result是实体类， 可以直接访问属性；
              self.fyxx = resp.GetModelResult; //return
            //  回写数据
            [self loadData];
        }
    }
}

 //  回写数据
-(void)loadData{
    self.donghao.text = self.fyxx.dongHao;
    self.danyuan.text = self.fyxx.danYuan;
    self.fanghao.text = self.fyxx.fangHao;
    self.huxing.text = self.fyxx.huXing;
    self.taonei.text = self.fyxx.taoNei;
    self.jianzhumj.text = self.fyxx.jianZhuMJ;
    self.SDmianj.text = self.fyxx.shiDeMJ;
    self.yuanjia0.text = self.fyxx.yuanJia0;
    self.yuanjia0.text = [NSString stringWithFormat:@"%.2f",[self.fyxx.yuanJia0 floatValue]];
    self.yuanjia1.text = self.fyxx.yuanJia1;
    self.yuanjia1.text = [NSString stringWithFormat:@"%.2f",[self.fyxx.yuanJia1 floatValue]];
    self.difang0.text = self.fyxx.diFangYH0;
    self.difang0.text = [NSString stringWithFormat:@"%.2f",[self.fyxx.diFangYH0 floatValue]];
    self.difang1.text = self.fyxx.diFangYH1;
    self.difang1.text = [NSString stringWithFormat:@"%.2f",[self.fyxx.diFangYH1 floatValue]];
    self.xuanfang0.text = self.fyxx.zaiYH0;
    self.xuanfang0.text = [NSString stringWithFormat:@"%.2f",[self.fyxx.zaiYH0 floatValue]];
    self.xuanfang1.text = self.fyxx.zaiYH1;
    self.xuanfang1.text = [NSString stringWithFormat:@"%.2f",[self.fyxx.zaiYH1 floatValue]];
    
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat screenWidth = size.width;
    CGFloat mainWidth = screenWidth * 0.8;
    NSLog(@"------%f",mainWidth);
    
    
    if ([self.fyxx.is_sold isEqualToString: SOLD]){
        self.difang0.hidden = YES;
        self.difang1.hidden = YES;
        self.xuanfang0.hidden = YES;
        self.xuanfang1.hidden = YES;
        self.difang2.hidden = YES;
        self.zaixuan2.hidden = YES;
        self.btnQX.hidden = NO;
        self.btn1.hidden = YES;
        self.imageV.hidden = NO;
        
        self.btnQX = [[UIButton alloc] initWithFrame:CGRectMake(400, 422, 100, 40)];
        [self.btnQX setTitle:@"取消已售" forState:UIControlStateNormal];
        [self.btnQX setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:239/255.0 green:8/255.0 blue:8/255.0 alpha:1]] forState:UIControlStateNormal];
        [self.btnQX addTarget:self action:@selector(myButtonQX:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnQX];
        
    }else{
        self.difang0.hidden = NO;
        self.difang1.hidden = NO;
        self.xuanfang0.hidden = NO;
        self.xuanfang1.hidden = NO;
        self.difang2.hidden = NO;
        self.zaixuan2.hidden = NO;
        self.btnQX.hidden = YES;
        self.imageV.hidden = YES;
        
        self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(-150, 422, mainWidth, 40)];
        [self.btn1 setTitle:@"销售" forState:UIControlStateNormal];
        [self.btn1 setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:33/255.0 green:146/255.0 blue:49/255.0 alpha:1]] forState:UIControlStateNormal];
        [self.btn1 addTarget:self action:@selector(myButton1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn1];
        

    }

}
-(void)myButton:(UIButton *)sender{
    UIView *superView = [self superview];
    [self removeFromSuperview];
    [superView removeFromSuperview];
    
    
    
    
}

//  xiaoshou Action
-(void)myButton1:(UIButton *)sender{
    UIAlertController *alerter = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否销售此房屋？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
         DzlsInterFaceManager *manager = [[DzlsInterFaceManager alloc]init];
        // 提交修改
        NSString *result = [manager updateFYXXSold:self.fyxx];
        
        if (![result isEqualToString:@"1"]) {//失败
            //  提示错误
            [self.window showHUDWithText:@"操作失败" Type:ShowPhotoNo Enabled:YES];
        }else{  //成功
            [self.window showHUDWithText:@"操作成功" Type:ShowPhotoYes Enabled:YES];
            //  刷新详情界面
            DzlsInterFaceSoap12Binding *binding = [manager defaultBinding];
            DzlsInterFace_GetModel *parameters =[[DzlsInterFace_GetModel alloc]init];
            // 设置传入服务参数
            parameters.xuhao = [NSString stringWithFormat:@"%d", self.xuHao];
            [binding GetModelAsyncUsingParameters:parameters delegate:self];
            
            //  刷新主界面
             dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                DzlsInterFaceManager *manager = [[DzlsInterFaceManager alloc]init];
                self.mainViewController.fyxxList = [manager getList:@""];
                NSLog(@"开始执行刷新异步操作");
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.mainViewController.tableView reloadData];
                    NSLog(@"通知主线程开始刷新");
                });
            });
            
            

            
        }
    }];
    
    [alerter addAction:cancelAction];
    [alerter addAction:okAction];
    
    [self.mainViewController presentViewController:alerter animated:true completion:^{
        
     }];

    
}
// 退房
-(void)myButtonQX:(UIButton *)sender{
    UIAlertController *alerter = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否取消销售已售？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        DzlsInterFaceManager *manager = [[DzlsInterFaceManager alloc]init];
        // 提交修改
        NSString *result = [manager updateFYXXNotSold:self.fyxx];
        
        if (![result isEqualToString:@"1"]) {//失败
            //  提示错误
            [self.window showHUDWithText:@"操作失败" Type:ShowPhotoNo Enabled:YES];
        }else{  //成功
            [self.window showHUDWithText:@"操作成功" Type:ShowPhotoYes Enabled:YES];
            //  刷新详情界面
            DzlsInterFaceSoap12Binding *binding = [manager defaultBinding];
            DzlsInterFace_GetModel *parameters =[[DzlsInterFace_GetModel alloc]init];
            // 设置传入服务参数
            parameters.xuhao = [NSString stringWithFormat:@"%d", self.xuHao];
            [binding GetModelAsyncUsingParameters:parameters delegate:self];
            
            //  刷新主界面
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                DzlsInterFaceManager *manager = [[DzlsInterFaceManager alloc]init];
                self.mainViewController.fyxxList = [manager getList:@""];
                NSLog(@"开始执行刷新异步操作");
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.mainViewController.tableView reloadData];
                    NSLog(@"通知主线程开始刷新");
                });
            });
        }
    }];
    
    [alerter addAction:cancelAction];
    [alerter addAction:okAction];
    
    [self.mainViewController presentViewController:alerter animated:true completion:^{
        
    }];
    
    
}

// UIColor-->UIImage
- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


-(void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGSize size = rect.size;
    CGFloat viewWidth = size.width;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 2);
    UIColor *sourceColor = [UIColor colorWithWhite:0.7 alpha:0.5];
    CGContextSetStrokeColorWithColor(ctx, sourceColor.CGColor);
    
    CGContextSetLineCap(ctx, kCGLineCapSquare);
    // 设置起点坐标
    CGContextMoveToPoint(ctx, viewWidth * self.progress, viewWidth * 0.19);
    // 设置终点坐标
    CGContextAddLineToPoint(ctx, viewWidth, viewWidth * 0.19);
    // 绘制
    CGContextStrokePath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, self.themeColor.CGColor);
    // 设置起点坐标
    CGContextMoveToPoint(ctx, 0, viewWidth * 0.19);
    // 设置终点坐标
    CGContextAddLineToPoint(ctx, viewWidth * self.progress, viewWidth * 0.19);
    // 绘制
    CGContextStrokePath(ctx);
}


@end
