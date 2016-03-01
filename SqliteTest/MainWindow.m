//
//  MainWindow.m
//  PopupViewStudy
//
//

#import "MainWindow.h"
#import "DzlsInterFaceManager.h"

@implementation MainWindow

- (instancetype)initWithPopup:(Popup*)popup;
{
    self = [super init];
    if (self) {
        
        // 获取屏幕信息
        CGRect rect = [[UIScreen mainScreen] bounds];
        CGSize size = rect.size;
        CGFloat screenWidth = size.width;
        CGFloat mainWidth = screenWidth * 0.8;
        NSLog(@"------%f",mainWidth);
        
        self.popup = popup;
        self.progress = 0;
        self.themeColor = [UIColor colorWithRed:68/255.0 green:180/255.0 blue:255/255.0 alpha:1];
        self.clipsToBounds = YES;// 如果子视图的范围超出了父视图的边界，超出的部分就会被裁剪掉。
        
        
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainWidth * 0.3, (mainWidth / 14)-80, mainWidth * 0.8, mainWidth * 0.16)];
        titleLabel.text = popup.title;
        titleLabel.textColor = self.themeColor;
        titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:titleLabel];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(-150, 472, mainWidth, 40)];
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        [btn setBackgroundImage:[self createImageWithColor:self.themeColor] forState:UIControlStateNormal];
        [self addSubview:btn];
        
        
        UITextView *msgTextView = [[UITextView alloc] initWithFrame:CGRectMake(40, 102, 200, 40)];
//        msgTextView.textContainerInset = UIEdgeInsetsMake(mainWidth * 0.05, mainWidth * 0.05, 20, mainWidth * 0.05);
//        msgTextView.backgroundColor = [UIColor redColor];
        msgTextView.text = popup.xuhao;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineSpacing = 10.f;
        
        UITextView *donghao = [[UITextView alloc] initWithFrame:CGRectMake(250, 102, 200, 40)];
        UITextView *danyuan = [[UITextView alloc] initWithFrame:CGRectMake(40, 140, 200, 40)];
        UITextView *fanghao = [[UITextView alloc] initWithFrame:CGRectMake(250, 140, 200, 40)];
        UITextView *huxing = [[UITextView alloc] initWithFrame:CGRectMake(40, 180, 200, 40)];
        UITextView *taonei = [[UITextView alloc] initWithFrame:CGRectMake(250, 180, 200, 40)];
        UITextView *jianzhumj = [[UITextView alloc] initWithFrame:CGRectMake(40, 220, 200, 40)];
        UITextView *SDmianj = [[UITextView alloc] initWithFrame:CGRectMake(250, 220, 200, 40)];
        UITextView *yuanjia0 = [[UITextView alloc] initWithFrame:CGRectMake(40, 260, 200, 40)];
        UITextView *yuanjia1 = [[UITextView alloc] initWithFrame:CGRectMake(250, 260, 200, 40)];
        UITextView *difang0 = [[UITextView alloc] initWithFrame:CGRectMake(40, 300, 200, 40)];
        UITextView *difang1 = [[UITextView alloc] initWithFrame:CGRectMake(250, 300, 200, 40)];
        UITextView *xuanfang0 = [[UITextView alloc] initWithFrame:CGRectMake(40, 340, 200, 40)];
        UITextView *xuanfang1 = [[UITextView alloc] initWithFrame:CGRectMake(250, 340, 200, 40)];
       
        /*
        paragraphStyle.lineHeightMultiple = 10.f;
        paragraphStyle.maximumLineHeight = 20.f;
        paragraphStyle.minimumLineHeight = 10.f;
        paragraphStyle.firstLineHeadIndent = 10.f; // 首行缩进
        */
        paragraphStyle.alignment = NSTextAlignmentJustified;
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12], NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5 alpha:1]};
        msgTextView.attributedText = [[NSAttributedString alloc]initWithString:self.popup.xuhao attributes:attributes];
        donghao.attributedText = [[NSAttributedString alloc]initWithString:self.popup.donghao attributes:attributes];
        danyuan.attributedText = [[NSAttributedString alloc]initWithString:self.popup.danyuan attributes:attributes];
        fanghao.attributedText = [[NSAttributedString alloc]initWithString:self.popup.fanghao attributes:attributes];
        huxing.attributedText = [[NSAttributedString alloc]initWithString:self.popup.huxing attributes:attributes];
        taonei.attributedText = [[NSAttributedString alloc]initWithString:self.popup.taonei attributes:attributes];
        jianzhumj.attributedText = [[NSAttributedString alloc]initWithString:self.popup.jianzhumj attributes:attributes];
        SDmianj.attributedText = [[NSAttributedString alloc]initWithString:self.popup.SDmianj attributes:attributes];
        yuanjia0.attributedText = [[NSAttributedString alloc]initWithString:self.popup.yuanjia0 attributes:attributes];
        yuanjia1.attributedText = [[NSAttributedString alloc]initWithString:self.popup.yuanjia1 attributes:attributes];
        difang0.attributedText = [[NSAttributedString alloc]initWithString:self.popup.difang0 attributes:attributes];
        difang1.attributedText = [[NSAttributedString alloc]initWithString:self.popup.difang1 attributes:attributes];
        xuanfang0.attributedText = [[NSAttributedString alloc]initWithString:self.popup.xuanfang0 attributes:attributes];
        xuanfang1.attributedText = [[NSAttributedString alloc]initWithString:self.popup.xuanfang1 attributes:attributes];
        
      
        
        
        if ([difang0.text isEqualToString:@"0.00"]){
            difang0.hidden = YES;
            difang1.hidden = YES;
            xuanfang0.hidden = YES;
            xuanfang1.hidden = YES;
        }else{
            difang0.hidden = NO;
            difang1.hidden = NO;
            xuanfang0.hidden = NO;
            xuanfang1.hidden = NO;
        }
                
        // 设置不可编辑
        [msgTextView setEditable:NO];
        [donghao setEditable:NO];
        [danyuan setEditable:NO];
        [huxing setEditable:NO];
        [fanghao setEditable:NO];
        [taonei setEditable:NO];
        [jianzhumj setEditable:NO];
        [SDmianj setEditable:NO];
        [yuanjia1 setEditable:NO];
        [yuanjia0 setEditable:NO];
        [difang0 setEditable:NO];
        [difang1 setEditable:NO];
        [xuanfang0 setEditable:NO];
        [xuanfang1 setEditable:NO];
        
        [self addSubview:msgTextView];
        [self addSubview:donghao];
        [self addSubview:danyuan];
        [self addSubview:huxing];
        [self addSubview:fanghao];
        [self addSubview:taonei];
        [self addSubview:jianzhumj];
        [self addSubview:SDmianj];
        [self addSubview:yuanjia0];
        [self addSubview:yuanjia1];
        [self addSubview:difang0];
        [self addSubview:difang1];
        [self addSubview:xuanfang0];
        [self addSubview:xuanfang1];
        
        
        
    }
    return self;
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
