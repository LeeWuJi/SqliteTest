//
//  DbBase.h
//  SqliteTest
//
//  Created by LeeWuji on 16/2/24.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>  //库文件只能import

@interface DbBase : NSObject
+(id)sharedDbBase;
-(sqlite3* )DBOpen;
//+(void) DBClose;
-(sqlite3_stmt* )prepare: (NSString*)sql withParams:(NSArray*)params;
//+(void)getFYXXList;
@end
