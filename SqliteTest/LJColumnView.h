//
//  LJColumnView.h
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJColumnView : UIView
    @property (nonatomic,strong) NSString *num;
    @property (nonatomic,strong) NSString *detail;
-(void)setHeaderStyle;
@end
