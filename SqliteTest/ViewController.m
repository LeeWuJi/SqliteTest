 //
//  ViewController.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/24.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//
#import "ViewController.h"
#import "DbBase.h"
#import "FangYXXService.h"
#import "FangYXX.h"
#import "LJRowView.h"
#import "LJConstant.h"
#import "LJTableHeadView.h"
#import "PopupView.h"
#import "Popup.h"
#import "DzlsInterFace.h"
#import "DzlsInterFaceManager.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

//@property (nonatomic,strong) NSMutableArray *fyxxList;  //dataSource
//@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *tableHeadView;
@property (nonatomic,strong) NSArray *columnWidthList;  //单元格配置信息
@property (nonatomic,strong)UIView *upLine;
@property int SCREEN_WIDTH;
@property int SCREEN_HEIGHT;
@property int COLUMN_HEIGHT;
@property double COLUMN_WIDTH;

@end

@implementation ViewController{
    NSTimer *_timer;
    NSInteger _mytime;
    PopupView *_popupView;
}


- (void)viewDidLoad {
    //  initConstant
    self.SCREEN_WIDTH = [LJConstant getSCREEN_WIDTH];
    self.SCREEN_HEIGHT = [LJConstant getSCREEN_HEIGHT];
    self.COLUMN_HEIGHT = [LJConstant getCOLUMN_HEIGHT];
    self.COLUMN_WIDTH = [LJConstant getCOLUMN_WIDTH];
    
    [super viewDidLoad];
    self.title=@"富春山水居项目价格表";
    self.view.backgroundColor=[UIColor whiteColor];
    
    //  初始化表头
    [self initTableHeadView];
    //  配置单元格
    [self initColumnWidthList];
    [self initData];
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(10, 60, self.SCREEN_WIDTH - 20, self.SCREEN_HEIGHT-60) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.bounces=NO;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor=[UIColor clearColor];
    
    UIView *leftLine = [[UIView alloc]initWithFrame:CGRectMake(8, 60, 3.5, self.tableView.frame.size.height)];
    leftLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview: leftLine];
    
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(1024-12, 60, 3.5, self.tableView.frame.size.height)];
    rightLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview: rightLine];
    
    self.upLine = [[UIView alloc]initWithFrame:CGRectMake(0, 4, 1024, 3.0)];
    self.upLine.backgroundColor = [UIColor blackColor];
    [self.tableHeadView addSubview:self.upLine];

    
    [self.view addSubview:self.tableView];
    
    
    UIBarButtonItem *showBtn = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleDone target:self action:@selector(showPopupView:)];
    self.navigationItem.rightBarButtonItem = showBtn;
}

-(void)initTableHeadView    {
    //  配置每列宽度
    NSArray *columnWidthList = [[NSArray alloc] initWithObjects:
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C0
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C1
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C2
                              //[NSNumber numberWithInt: width],  //C3
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C4
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C5
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C6
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C7
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C8
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH * 2],  //C9
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH * 2],  //C10
                              [NSNumber numberWithDouble: self.COLUMN_WIDTH * 2 + 10],  //C11
                              nil];
    //  配置每列标题
    NSArray *columnTitleList = [[NSArray alloc] initWithObjects:
                              @"序号",  //C0    0
                              @"栋号",  //C1    1
                              @"单元",  //C2    2
                             // @"楼层",  //C3    3
                              @"房号",  //C4    4
                              @"户型",  //C5    5
                              @"套内",  //C6    6
                              @"建筑面积",//C7   7
                              @"实得面积",//C8 8
                              @"原  价",//C9 C10 9
                              @"工程抵房优惠10%",//C11 C12 10
                              @"工程选房再优惠5%",//C13 C14 11
                              nil];

   
    self.tableHeadView = [[LJTableHeadView alloc]initWithFrame:CGRectMake(0, 80, self.SCREEN_WIDTH, self.SCREEN_HEIGHT) columnWidthList:columnWidthList columnTitleList:columnTitleList];
    
}

-(void)initColumnWidthList  {
    self.columnWidthList = [[NSArray alloc] initWithObjects:
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C0
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C1
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C2
                            //[NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C3
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C4
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C5
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C6
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C7
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C8
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C9
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C10
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C11
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C12
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH],  //C13
                            [NSNumber numberWithDouble: self.COLUMN_WIDTH + 10],  //C14 没用 在setData里面重新设置
                            nil];
}

-(void)initData{
    //调用服务
    //  本地数据库
    //FangYXXService *fyxxSevice = [[FangYXXService alloc]init];
    //self.fyxxList = [fyxxSevice getFangYXXList];
    
    // remoteDataBase
   DzlsInterFaceManager *manager = [[DzlsInterFaceManager alloc]init];
   self.fyxxList = [manager getList:@""];
   // NSLog(@"");
}

#pragma dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.fyxxList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"cell";
    
    LJRowView *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell = [[LJRowView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier columnWidthList:self.columnWidthList];
        cell.backgroundColor=[UIColor grayColor];
        cell.selectionStyle=UITableViewCellSelectionStyleGray;
    }

    DzlsInterFace_Local_HousingResources *fyxx = self.fyxxList[indexPath.row];
    [cell setData:fyxx];
    
    return cell;
}

#pragma delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
//    NSArray *views = self.view.subviews;
//    for (UIView *view in views) {
//        if ([view isKindOfClass:[PopupView class]]) {
//            return;
//        }
//    }
//    // 初始化定时器
////    [_timer invalidate];
//    _mytime = 0;
//    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(refreshProgress) userInfo:nil repeats:YES];
    
    
    DzlsInterFace_Local_HousingResources *fyxx = self.fyxxList[indexPath.row];
        
    //    NSString *str = [NSString stringWithFormat:@"序号:%@",dhsa];
    Popup *popup = [[Popup alloc] initWithTitle:@"房屋信息" xuhao:[NSString stringWithFormat:@"%d",fyxx.xuHao.intValue] donghao:[NSString stringWithFormat:@"栋号:  %@",fyxx.dongHao] danyuan:[NSString stringWithFormat:@"单元:  %@",fyxx.danYuan] fanghao:[NSString stringWithFormat:@"房号:  %@",fyxx.fangHao] huxing:[NSString stringWithFormat:@"户型:  %@",fyxx.huXing] taonei:[NSString stringWithFormat:@"套内:  %@",fyxx.taoNei] jianzhumj:[NSString stringWithFormat:@"建筑面积:  %@",fyxx.jianZhuMJ] SDmianj:[NSString stringWithFormat:@"实得面积:  %@",fyxx.shiDeMJ] yuanjia0:[NSString stringWithFormat:@"原价:  %@",fyxx.yuanJia0] yuanjia1:[NSString stringWithFormat:@"原价:  %@",fyxx.yuanJia1] difang0:[NSString stringWithFormat:@"工程抵房优惠10% %:  %@",fyxx.diFangYH0] difang1:[NSString stringWithFormat:@"工程抵房优惠10%%:  %@",fyxx.diFangYH1] xuanfang0:[NSString stringWithFormat:@"工程选房再优惠5%%:  %@",fyxx.zaiYH0] xuanfang1:[NSString stringWithFormat:@"工程选房再优惠5%%:  %@",fyxx.zaiYH1] btnContent:@"确定"];
 
    _popupView = [[PopupView alloc]initWithPopup:popup withMainViewController:self];
    [self.view addSubview:_popupView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.tableHeadView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section    {
    return self.COLUMN_HEIGHT;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showPopupView:(id)sender {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        DzlsInterFaceManager *manager = [[DzlsInterFaceManager alloc]init];
        self.fyxxList = [manager getList:@""];
        NSLog(@"开始执行刷新异步操作");
        dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
        NSLog(@"通知主线程开始刷新");
    });
    });
    
}
-(void)refreshProgress {
//    _mytime ++;
//    
//    if (_mytime > 10) {
////        [_timer invalidate];
//    }else {
//        _popupView.mainWindow.progress = _mytime / 10.0;
//    }
 //  NSLog(@"www.baidu.com");
}
@end
