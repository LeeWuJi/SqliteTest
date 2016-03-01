//
//  DzlsInterFaceManager.h
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DzlsInterFace.h"

@interface DzlsInterFaceManager : NSObject
-(DzlsInterFaceSoap12Binding*)defaultBinding;
-(id)getList :(NSString*)where;
-(id)getModel :(NSNumber*)xuhao;
-(NSString*)updateFYXXSold :(DzlsInterFace_Local_HousingResources*) fyxx;
-(NSString*)updateFYXXNotSold :(DzlsInterFace_Local_HousingResources*) fyxx;

@end
