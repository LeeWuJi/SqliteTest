//
//  FangYXXService.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/25.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import "FangYXXService.h"
#import "DbBase.h"
#import "FangYXX.h"

@interface FangYXXService()
    @property (nonatomic,strong)DbBase *dbbase;
@end


@implementation FangYXXService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dbbase = [DbBase sharedDbBase];
    }
    return self;
}

-(NSMutableArray*)getFangYXXList{
    NSString *sql = @"select * from T_Local_HousingResources";
    sqlite3_stmt *stmt = [self.dbbase prepare:sql withParams:nil];
    //  封装为FangYXX数组
    NSMutableArray *fangyxxList = [NSMutableArray array];
    //判断SQL执行的结果
    while (sqlite3_step(stmt) == SQLITE_ROW) {//存在一行数据
        //列数从0开始
        int xuHao = sqlite3_column_int(stmt, 0);               //序号√
        const unsigned char *dongHao = sqlite3_column_text(stmt, 1);       //栋号√
        const unsigned char *danYuan = sqlite3_column_text(stmt, 2);       //单元√
        const unsigned char *louCeng = sqlite3_column_text(stmt, 3);       //楼层√
        const unsigned char *fangHao = sqlite3_column_text(stmt, 4);       //房号√
        const unsigned char *huXing = sqlite3_column_text(stmt, 5);        //户型√
        
        const unsigned char *taoNei = sqlite3_column_text(stmt, 6);        //套内√
        const unsigned char *jianZhuMJ = sqlite3_column_text(stmt, 7);     //建筑面积√
        
        const unsigned char *tuanGouDJ = sqlite3_column_text(stmt, 8);     //团购单价√
        const unsigned char *tuanGouDJ105 = sqlite3_column_text(stmt, 9);  //增加5%单价√
        
        const unsigned char *tuanGouZJ = sqlite3_column_text(stmt, 10);     //团购总价√
        const unsigned char *tuanGouZJ105 = sqlite3_column_text(stmt, 11);  //增加5%总价√
        
        const unsigned char *xuanFangYH0 = sqlite3_column_text(stmt, 12);   //选房再优惠5%√
        const unsigned char *xuanFangYH1 = sqlite3_column_text(stmt, 13);   //选房再优惠5%√
        
        const unsigned char *shiChangYH0 = sqlite3_column_text(stmt, 14);   //市场及工程优惠10%√
        const unsigned char *shiChangYH1 = sqlite3_column_text(stmt, 15);   //市场及工程优惠10%√
        
        const unsigned char *shiDeMJ = sqlite3_column_text(stmt, 16);       //实得面积√
        
        const unsigned char *yuanJia0 = sqlite3_column_text(stmt, 17);      //原价√
        const unsigned char *yuanJia1 = sqlite3_column_text(stmt, 18);      //原价√
        
        const unsigned char *diFangYH0 = sqlite3_column_text(stmt, 19);     //市场客户及工程抵房优惠10%√
        const unsigned char *diFangYH1 = sqlite3_column_text(stmt, 20);     //市场客户及工程抵房优惠10%√
        const unsigned char *zaiYH0 = sqlite3_column_text(stmt, 21);        //市场客户及工程选房再优惠5%√
        const unsigned char *zaiYH1 = sqlite3_column_text(stmt, 22);        //市场客户及工程选房再优惠5%√
        
        //NSLog(@"%d", xuHao);
        //封装FangYXX模型
        FangYXX *fangyxx = [[FangYXX alloc] init];
        fangyxx.xuHao = xuHao;  //0
        
        fangyxx.dongHao = [NSString stringWithUTF8String:(const char *)dongHao];    //1
        fangyxx.danYuan = [NSString stringWithUTF8String:(const char *)danYuan];    //2
        fangyxx.louCeng = [NSString stringWithUTF8String:(const char *)louCeng];    //3
        fangyxx.fangHao = [NSString stringWithUTF8String:(const char *)fangHao];    //4
        fangyxx.huXing = [NSString stringWithUTF8String:(const char *)huXing];      //5
        
        fangyxx.taoNei = [NSString stringWithUTF8String:(const char *)taoNei];      //6
        fangyxx.jianZhuMJ = [NSString stringWithUTF8String:(const char *)jianZhuMJ];//7
        
        fangyxx.tuanGouDJ = [NSString stringWithUTF8String:(const char *)tuanGouDJ];//8
        fangyxx.tuanGouDJ105 = [NSString stringWithUTF8String:(const char *)tuanGouDJ105];//9
        
        fangyxx.tuanGouZJ = [NSString stringWithUTF8String:(const char *)tuanGouZJ];    //10
        fangyxx.tuanGouZJ105 = [NSString stringWithUTF8String:(const char *)tuanGouZJ105];//11
        
        fangyxx.xuanFangYH0 = [NSString stringWithUTF8String:(const char *)xuanFangYH0];//12
        fangyxx.xuanFangYH1 = [NSString stringWithUTF8String:(const char *)xuanFangYH1];//13
        
        fangyxx.shiChangYH0 = [NSString stringWithUTF8String:(const char *)shiChangYH0];//14
        fangyxx.shiChangYH1 = [NSString stringWithUTF8String:(const char *)shiChangYH1];//15
        
        fangyxx.shiDeMJ = [NSString stringWithUTF8String:(const char *)shiDeMJ];        //16
        
        fangyxx.yuanJia0 = [NSString stringWithUTF8String:(const char *)yuanJia0];      //17
        fangyxx.yuanJia1 = [NSString stringWithUTF8String:(const char *)yuanJia1];      //18
        
        fangyxx.diFangYH0 = [NSString stringWithUTF8String:(const char *)diFangYH0];    //19
        fangyxx.diFangYH1 = [NSString stringWithUTF8String:(const char *)diFangYH1];    //20
        
        fangyxx.zaiYH0 = [NSString stringWithUTF8String:(const char *)zaiYH0];          //21
        fangyxx.zaiYH1 = [NSString stringWithUTF8String:(const char *)zaiYH1];          //22
        
        //添加到数组
        [fangyxxList addObject:fangyxx];
    }// while
    //释放stmt指针
    sqlite3_finalize(stmt);
    return fangyxxList;
}

-(NSMutableArray*) getFangYXXByXuhao: (int) Xuhao{
    NSString *sql = @"select * from T_Local_HousingResources where Xuhao=?";
    //  构造传入参数
    NSArray *params = [[NSArray alloc] initWithObjects:
                              [NSNumber numberWithInt: Xuhao],nil];
    
    sqlite3_stmt *stmt = [self.dbbase prepare:sql withParams: params];
    //  封装为FangYXX数组
    NSMutableArray *fangyxxList = [NSMutableArray array];
    //判断SQL执行的结果
    while (sqlite3_step(stmt) == SQLITE_ROW) {//存在一行数据
        //列数从0开始
        int xuHao = sqlite3_column_int(stmt, 0);               //序号√
        const unsigned char *dongHao = sqlite3_column_text(stmt, 1);       //栋号√
        const unsigned char *danYuan = sqlite3_column_text(stmt, 2);       //单元√
        const unsigned char *louCeng = sqlite3_column_text(stmt, 3);       //楼层√
        const unsigned char *fangHao = sqlite3_column_text(stmt, 4);       //房号√
        const unsigned char *huXing = sqlite3_column_text(stmt, 5);        //户型√
        
        const unsigned char *taoNei = sqlite3_column_text(stmt, 6);        //套内√
        const unsigned char *jianZhuMJ = sqlite3_column_text(stmt, 7);     //建筑面积√
        
        const unsigned char *tuanGouDJ = sqlite3_column_text(stmt, 8);     //团购单价√
        const unsigned char *tuanGouDJ105 = sqlite3_column_text(stmt, 9);  //增加5%单价√
        
        const unsigned char *tuanGouZJ = sqlite3_column_text(stmt, 10);     //团购总价√
        const unsigned char *tuanGouZJ105 = sqlite3_column_text(stmt, 11);  //增加5%总价√
        
        const unsigned char *xuanFangYH0 = sqlite3_column_text(stmt, 12);   //选房再优惠5%√
        const unsigned char *xuanFangYH1 = sqlite3_column_text(stmt, 13);   //选房再优惠5%√
        
        const unsigned char *shiChangYH0 = sqlite3_column_text(stmt, 14);   //市场及工程优惠10%√
        const unsigned char *shiChangYH1 = sqlite3_column_text(stmt, 15);   //市场及工程优惠10%√
        
        const unsigned char *shiDeMJ = sqlite3_column_text(stmt, 16);       //实得面积√
        
        const unsigned char *yuanJia0 = sqlite3_column_text(stmt, 17);      //原价√
        const unsigned char *yuanJia1 = sqlite3_column_text(stmt, 18);      //原价√
        
        const unsigned char *diFangYH0 = sqlite3_column_text(stmt, 19);     //市场客户及工程抵房优惠10%√
        const unsigned char *diFangYH1 = sqlite3_column_text(stmt, 20);     //市场客户及工程抵房优惠10%√
        const unsigned char *zaiYH0 = sqlite3_column_text(stmt, 21);        //市场客户及工程选房再优惠5%√
        const unsigned char *zaiYH1 = sqlite3_column_text(stmt, 22);        //市场客户及工程选房再优惠5%√
        
        //NSLog(@"%d", xuHao);
        //封装FangYXX模型
        FangYXX *fangyxx = [[FangYXX alloc] init];
        fangyxx.xuHao = xuHao;  //0
        
        fangyxx.dongHao = [NSString stringWithUTF8String:(const char *)dongHao];    //1
        fangyxx.danYuan = [NSString stringWithUTF8String:(const char *)danYuan];    //2
        fangyxx.louCeng = [NSString stringWithUTF8String:(const char *)louCeng];    //3
        fangyxx.fangHao = [NSString stringWithUTF8String:(const char *)fangHao];    //4
        fangyxx.huXing = [NSString stringWithUTF8String:(const char *)huXing];      //5
        
        fangyxx.taoNei = [NSString stringWithUTF8String:(const char *)taoNei];      //6
        fangyxx.jianZhuMJ = [NSString stringWithUTF8String:(const char *)jianZhuMJ];//7
        
        fangyxx.tuanGouDJ = [NSString stringWithUTF8String:(const char *)tuanGouDJ];//8
        fangyxx.tuanGouDJ105 = [NSString stringWithUTF8String:(const char *)tuanGouDJ105];//9
        
        fangyxx.tuanGouZJ = [NSString stringWithUTF8String:(const char *)tuanGouZJ];    //10
        fangyxx.tuanGouZJ105 = [NSString stringWithUTF8String:(const char *)tuanGouZJ105];//11
        
        fangyxx.xuanFangYH0 = [NSString stringWithUTF8String:(const char *)xuanFangYH0];//12
        fangyxx.xuanFangYH1 = [NSString stringWithUTF8String:(const char *)xuanFangYH1];//13
        
        fangyxx.shiChangYH0 = [NSString stringWithUTF8String:(const char *)shiChangYH0];//14
        fangyxx.shiChangYH1 = [NSString stringWithUTF8String:(const char *)shiChangYH1];//15
        
        fangyxx.shiDeMJ = [NSString stringWithUTF8String:(const char *)shiDeMJ];        //16
        
        fangyxx.yuanJia0 = [NSString stringWithUTF8String:(const char *)yuanJia0];      //17
        fangyxx.yuanJia1 = [NSString stringWithUTF8String:(const char *)yuanJia1];      //18
        
        fangyxx.diFangYH0 = [NSString stringWithUTF8String:(const char *)diFangYH0];    //19
        fangyxx.diFangYH1 = [NSString stringWithUTF8String:(const char *)diFangYH1];    //20
        
        fangyxx.zaiYH0 = [NSString stringWithUTF8String:(const char *)zaiYH0];          //21
        fangyxx.zaiYH1 = [NSString stringWithUTF8String:(const char *)zaiYH1];          //22
        
        //添加到数组
        [fangyxxList addObject:fangyxx];
    }// while
    //释放stmt指针
    sqlite3_finalize(stmt);
    return fangyxxList;
}


@end
