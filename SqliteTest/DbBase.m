//
//  DbBase.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/24.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import "DbBase.h"
#import <sqlite3.h>
#import <Foundation/Foundation.h>

@interface DbBase()


@end


@implementation DbBase
//类作用：获得指针，copy到document

static sqlite3 *dbPoint = nil;
static NSString *dbName = @"housing.db";
static DbBase *sharedDbBase = nil;

+(sqlite3 *)DBOpen{
    if (dbPoint) {
        return dbPoint;
    }else{
        NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *path = [NSString stringWithFormat:@"%@/%@", dir, dbName];
        NSLog(@"%@", path);
        //下面判断路径中是否又sqlite3文件，如果没有，从NSBundel copy它。
        if (![[NSFileManager defaultManager] fileExistsAtPath: path]) {     //一个单例 判断路径内是否有此文件，如果没有，执行
            NSString *sourcePath = [[NSBundle mainBundle]pathForResource: @"housing" ofType:@"db"];//获得Bundle包里的路径
            NSLog(@"%@", sourcePath);
            BOOL judge = [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:path error:NULL];//copy 从sourcePath到destinationPath
            if (judge) {
                NSLog(@"copy succeed");
            }else
                NSLog(@"copy false");
        }
        sqlite3_open([path UTF8String], &dbPoint); //通过UTF8String转化，返回const char类型 //&dbPoint是地址，指向sqlite的指针
        return dbPoint;
    }
}

+(id)sharedDbBase {
    @synchronized(self) {
        if (sharedDbBase == nil){
            sharedDbBase = [[self alloc] init];
            [self DBOpen];
        }
    }
    return sharedDbBase;
}

-(id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)dealloc
{
    [self DBClose];
}

-(void)DBClose{
    if (dbPoint) {
        // Get launch count value
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        NSInteger launchCount = [ud integerForKey: @"LaunchCount"];
        launchCount--;
        NSLog(@"SQLiteDB - Launch count \(launchCount)");
        BOOL clean = false;
        if (launchCount < 0 ){
            clean = true;
            launchCount = 500;
        }
        [ud setInteger:launchCount forKey:@"LaunchCount"];
        [ud synchronize ];
        // Do we clean DB?
        if (!clean) {
            sqlite3_close(dbPoint);
            return;
        }
        // Clean DB
        NSLog(@"SQLiteDB - Optimize DB");
        //let sql = "VACUUM; ANALYZE"
        //if execute(sql) != SQLITE_OK {
        //    print("SQLiteDB - Error cleaning DB")
        //}
        sqlite3_close(dbPoint);
    }
}


// Private method which prepares the SQL
-(sqlite3_stmt* )prepare: (NSString*)sql withParams:(NSArray*)params {
    sqlite3_stmt *stmt = nil;
    const char * cSql = [sql cStringUsingEncoding:NSUTF8StringEncoding];
    // Prepare
    int result = sqlite3_prepare_v2(dbPoint, cSql, -1, &stmt, nil);
    
    if (result != SQLITE_OK) {
        sqlite3_finalize(stmt);
        const char *cError = sqlite3_errmsg(dbPoint);
        NSString *error = [NSString stringWithUTF8String:cError];
        if(error){
            NSString *msg = [NSString stringWithFormat:@"SQLiteDB - failed to prepare SQL: %@/%@", sql, error];
            NSLog(@"%@", msg);
        }
        
        return stmt;
    }

    // Bind parameters, if any
    if (params != nil) {
        // Validate parameters
        int cntParams = sqlite3_bind_parameter_count(stmt);
        NSUInteger cnt = params.count;
        if (cntParams != cnt) {
            NSString *msg = @"SQLiteDB - failed to bind parameters, counts did not match. SQL: \(sql), Parameters: \(params)";
            NSLog(@"%@", msg);
            //return *stmt;
        }
        int flag = 0;
        // Text & BLOB values passed to a C-API do not work correctly if they are not marked as transient.
        for (int ndx = 1; ndx <= cnt; ndx++) {
            NSString *log4bingding = [NSString stringWithFormat:@"Binding: %@ at Index: %d", params[ndx-1], ndx];
            NSLog(@"%@",log4bingding);
            // Check for data types
            if([params[ndx-1] isKindOfClass:[NSString class]]){
                NSString *txt = (NSString*)params[ndx-1];
                const char *ctxt = [txt cStringUsingEncoding:NSUTF8StringEncoding];
                flag = sqlite3_bind_text(stmt, ndx, ctxt, -1, SQLITE_TRANSIENT);
//            } else if let data = params![ndx-1] as? NSData {
//                flag = sqlite3_bind_blob(stmt, CInt(ndx), data.bytes, CInt(data.length), SQLITE_TRANSIENT)
//            } else if let date = params![ndx-1] as? NSDate {
//                let txt = fmt.stringFromDate(date)
//                flag = sqlite3_bind_text(stmt, CInt(ndx), txt, -1, SQLITE_TRANSIENT)
//            } else if let val = params![ndx-1] as? Double {
//                flag = sqlite3_bind_double(stmt, CInt(ndx), CDouble(val))
            
               
            } else if([params[ndx-1] isKindOfClass:[NSNumber class]]){
                NSNumber *num = (NSNumber*)params[ndx-1];
                int val = num.intValue;
                flag = sqlite3_bind_int(stmt, ndx, val);
            } else {
                flag = sqlite3_bind_null(stmt, ndx);
            }
            
            // Check for errors
            if (flag != SQLITE_OK) {
                sqlite3_finalize(stmt);
                NSString *msg = @"SQLiteDB - failed to bind for SQL: \(sql), Parameters: \(params), Index: \(ndx) Error: \(error)";
                NSLog(@"%@", msg);
                return stmt;
            }
        }
    }
    return stmt;
}

/**
+(void)getFYXXList {
    NSString *sql = @"select * from T_Local_HousingResources";
    sqlite3_stmt *stmt = [DbBase prepare: sql withParams:nil];
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
            
            NSLog(@"%d", xuHao);
            //封装Student模型
           // Student *student = [[Student alloc] init];
           // student.ID = ID;
           // student.name = [NSString stringWithUTF8String:(const char *)name];
           // student.sex = [NSString stringWithUTF8String:(const char *)sex];
           // student.age = age;
           // student.photo = image;
            //添加到数组
           // [studentArr addObject:student];
    }// while
    //释放stmt指针
    sqlite3_finalize(stmt);
    //关闭数据库
    //[Database closeDB];
}
*/

@end
