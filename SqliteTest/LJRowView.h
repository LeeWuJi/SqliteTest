//
//  LJRowView.h
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FangYXX.h"
#import "DzlsInterFace.h"

@interface LJRowView : UITableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
columnWidthList:(NSArray*)columnWidthList;
-(void)setData: (DzlsInterFace_Local_HousingResources*) fyxx;
@end
