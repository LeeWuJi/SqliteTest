//
//  FangYXXService.h
//  SqliteTest
//
//  Created by LeeWuji on 16/2/25.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FangYXXService : NSObject
    -(NSMutableArray*) getFangYXXList;
-(NSMutableArray*) getFangYXXByXuhao: (int) Xuhao;
@end
