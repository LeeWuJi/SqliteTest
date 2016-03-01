//
//  DzlsInterFaceManager.m
//  SqliteTest
//
//  Created by LeeWuji on 16/2/26.
//  Copyright © 2016年 LeeWuji. All rights reserved.
//

#import "DzlsInterFaceManager.h"
#import "DzlsInterFace.h"

#define SOLD @"1"
#define NOT_SOLD @"0"

@implementation DzlsInterFaceManager

//  获得网络地址绑定对象
-(DzlsInterFaceSoap12Binding*)defaultBinding{
        DzlsInterFaceSoap12Binding *binding=[[DzlsInterFaceSoap12Binding alloc] initWithAddress:@"http://116.55.241.51:8080/DzlsInterFace.asmx"];
        //binding.logXMLInOut=YES;
        binding.logXMLInOut = NO;
        //  设置超时
        NSTimeInterval time = 5000;
        [binding setDefaultTimeout:time];
        return binding;
}

//  获得房源信息列表
/*
 <where>string</where>
*/
-(id)getList :(NSString*)where {
    id returnValue = nil;
    DzlsInterFaceSoap12Binding *binding = [self defaultBinding];
    // 找到这个类Xxx_ [方法名]
    DzlsInterFace_GetList *parameters =[[DzlsInterFace_GetList alloc]init];
    // 设置传入服务参数
    parameters.where = where;
 
    DzlsInterFaceSoap12BindingResponse *resp = [binding GetListUsingParameters: parameters];
   
    //返回值
    //resp 包含header bodyParts error;bodyParts 包含【方法名称】Result
    for(id mine in resp.bodyParts){
        if([mine isKindOfClass:[DzlsInterFace_GetListResponse class]]){
            //  类型转换
            DzlsInterFace_GetListResponse *response = (DzlsInterFace_GetListResponse*)mine;
            //  【方法】Result是实体类， 可以直接访问属性；
            returnValue = response.GetListResult.Local_HousingResources; //return NSNumber
        }
    }
    return returnValue;
}

//  根据ID获得房源信息
/*
 <where>string</where>
 */
-(id)getModel :(NSNumber*) xuhao {
    id returnValue = nil;
    DzlsInterFaceSoap12Binding *binding = [self defaultBinding];
    // 找到这个类Xxx_ [方法名]
    DzlsInterFace_GetModel *parameters =[[DzlsInterFace_GetModel alloc]init];
    // 设置传入服务参数
    parameters.xuhao = xuhao.stringValue;
    
    DzlsInterFaceSoap12BindingResponse *resp = [binding GetModelUsingParameters: parameters];
    
    //返回值
    //resp 包含header bodyParts error;bodyParts 包含【方法名称】Result
    for(id mine in resp.bodyParts){
        if([mine isKindOfClass:[DzlsInterFace_GetModelResponse class]]){
            //  类型转换
            DzlsInterFace_GetModelResponse *response = (DzlsInterFace_GetModelResponse*)mine;
            //  【方法】Result是实体类， 可以直接访问属性；
            returnValue = response.GetModelResult; //return
        }
    }
    return returnValue;
}

//  根据ID修改房源信息
/*
 <donghao>string</donghao>2
 <danYuan>string</danYuan>3
 <louCeng>string</louCeng>4
 <fangHao>string</fangHao>5
 <huXing>string</huXing>6
 <taoNei>string</taoNei>7
 <jianZhuMJ>string</jianZhuMJ>8
 <tuanGouDJ>string</tuanGouDJ>9
 <tuanGouDJ105>string</tuanGouDJ105>10
 <tuanGouZJ>string</tuanGouZJ>11
 <tuanGouZJ105>string</tuanGouZJ105>12
 <xuanFangYH0>string</xuanFangYH0>13
 <xuanFangYH1>string</xuanFangYH1>14
 <shiChangYH0>string</shiChangYH0>15
 <shiChangYH1>string</shiChangYH1>16
 <shiDeMJ>string</shiDeMJ>17
 <yuanJia0>string</yuanJia0>18
 <yuanJia1>string</yuanJia1>19
 <diFangYH0>string</diFangYH0>20
 <diFangYH1>string</diFangYH1>21
 <zaiYH0>string</zaiYH0>22
 <zaiYH1>string</zaiYH1>23
 <xuHao>string</xuHao>1
 */
-(NSString*)update :(NSNumber*) xuhao donghao:(NSString*)donghao danYuan:(NSString*)danYuan louCeng:(NSString*)louCeng fangHao:(NSString*)fangHao huXing:(NSString*)huXing taoNei:(NSString*)taoNei jianZhuMJ:(NSString*)jianZhuMJ tuanGouDJ:(NSString*)tuanGouDJ tuanGouDJ105:(NSString*)tuanGouDJ105 tuanGouZJ:(NSString*)tuanGouZJ tuanGouZJ105:(NSString*)tuanGouZJ105 xuanFangYH0:(NSString*)xuanFangYH0 xuanFangYH1:(NSString*)xuanFangYH1 shiChangYH0:(NSString*)shiChangYH0 shiChangYH1:(NSString*)shiChangYH1 shiDeMJ:(NSString*)shiDeMJ yuanJia0:(NSString*)yuanJia0 yuanJia1:(NSString*)yuanJia1 diFangYH0:(NSString*)diFangYH0 diFangYH1:(NSString*)diFangYH1 zaiYH0:(NSString*)zaiYH0 zaiYH1:(NSString*)zaiYH1{
    NSString *returnValue = nil;
    DzlsInterFaceSoap12Binding *binding = [self defaultBinding];
    // 找到这个类Xxx_ [方法名]
    DzlsInterFace_Update *parameters =[[DzlsInterFace_Update alloc]init];
    // 设置传入服务参数
    parameters.xuHao = xuhao.stringValue;   //1
    parameters.donghao = donghao;           //2
    parameters.danYuan = danYuan;           //3
    parameters.louCeng = louCeng;           //4
    parameters.fangHao = fangHao;           //5
    parameters.huXing = huXing;           //6
    parameters.taoNei = taoNei;           //7
    parameters.jianZhuMJ = jianZhuMJ;           //8
    parameters.tuanGouDJ = tuanGouDJ;           //9
    parameters.tuanGouDJ105 = tuanGouDJ105;           //10
    parameters.tuanGouZJ = tuanGouZJ;           //11
    parameters.tuanGouZJ105 = tuanGouZJ105;           //12
    parameters.xuanFangYH0 = xuanFangYH0;           //13
    parameters.xuanFangYH1 = xuanFangYH1;           //14
    parameters.shiChangYH0 = shiChangYH0;           //15
    parameters.shiChangYH1 = shiChangYH1;           //16
    parameters.shiDeMJ = shiDeMJ;           //17
    parameters.yuanJia0 = yuanJia0;           //18
    parameters.yuanJia1 = yuanJia1;           //19
    parameters.diFangYH0 = diFangYH0;       //20
    parameters.diFangYH1 = diFangYH1;       //21
    parameters.zaiYH0 = zaiYH0;           //22
    parameters.zaiYH1 = zaiYH1;           //23
    
    DzlsInterFaceSoap12BindingResponse *resp = [binding UpdateUsingParameters: parameters];
    
    //返回值
    //resp 包含header bodyParts error;bodyParts 包含【方法名称】Result
    for(id mine in resp.bodyParts){
        if([mine isKindOfClass:[DzlsInterFace_UpdateResponse class]]){
            //  类型转换
            DzlsInterFace_UpdateResponse *response = (DzlsInterFace_UpdateResponse*)mine;
            //  【方法】Result是实体类， 可以直接访问属性；
            returnValue = response.UpdateResult; //return
        }
    }
    return returnValue;
}

-(NSString*)updateFYXXSold :(DzlsInterFace_Local_HousingResources*) fyxx {
    NSString *returnValue = nil;
    DzlsInterFaceSoap12Binding *binding = [self defaultBinding];
    // 找到这个类Xxx_ [方法名]
    DzlsInterFace_Update *parameters =[[DzlsInterFace_Update alloc]init];
    // 设置传入服务参数
    parameters.xuHao = fyxx.xuHao.stringValue;   //1
    parameters.donghao = fyxx.dongHao;           //2
    parameters.danYuan = fyxx.danYuan;           //3
    parameters.louCeng = fyxx.louCeng;           //4
    parameters.fangHao = fyxx.fangHao;           //5
    parameters.huXing = fyxx.huXing;           //6
    parameters.taoNei = fyxx.taoNei;           //7
    parameters.jianZhuMJ = fyxx.jianZhuMJ;           //8
    parameters.tuanGouDJ = fyxx.tuanGouDJ;           //9
    parameters.tuanGouDJ105 = fyxx.tuanGouDJ105;           //10
    parameters.tuanGouZJ = fyxx.tuanGouZJ;           //11
    parameters.tuanGouZJ105 = fyxx.tuanGouZJ105;           //12
    parameters.xuanFangYH0 = fyxx.xuanFangYH0;           //13
    parameters.xuanFangYH1 = fyxx.xuanFangYH1;           //14
    parameters.shiChangYH0 = fyxx.shiChangYH0;           //15
    parameters.shiChangYH1 = fyxx.shiChangYH1;           //16
    parameters.shiDeMJ = fyxx.shiDeMJ;           //17
    parameters.yuanJia0 = fyxx.yuanJia0;           //18
    parameters.yuanJia1 = fyxx.yuanJia1;           //19
    
    parameters.diFangYH0 = fyxx.diFangYH0;       //20
    parameters.diFangYH1 = fyxx.diFangYH1;       //21
    parameters.zaiYH0 = fyxx.zaiYH0;           //22
    parameters.zaiYH1 = fyxx.zaiYH1;           //23
    
    parameters.is_sold = SOLD;
    
    DzlsInterFaceSoap12BindingResponse *resp = [binding UpdateUsingParameters: parameters];
    
    //返回值
    //resp 包含header bodyParts error;bodyParts 包含【方法名称】Result
    for(id mine in resp.bodyParts){
        if([mine isKindOfClass:[DzlsInterFace_UpdateResponse class]]){
            //  类型转换
            DzlsInterFace_UpdateResponse *response = (DzlsInterFace_UpdateResponse*)mine;
            //  【方法】Result是实体类， 可以直接访问属性；
            returnValue = response.UpdateResult; //return
        }
    }
    return returnValue;
}

-(NSString*)updateFYXXNotSold :(DzlsInterFace_Local_HousingResources*) fyxx {
    NSString *returnValue = nil;
    DzlsInterFaceSoap12Binding *binding = [self defaultBinding];
    // 找到这个类Xxx_ [方法名]
    DzlsInterFace_Update *parameters =[[DzlsInterFace_Update alloc]init];
    // 设置传入服务参数
    parameters.xuHao = fyxx.xuHao.stringValue;   //1
    parameters.donghao = fyxx.dongHao;           //2
    parameters.danYuan = fyxx.danYuan;           //3
    parameters.louCeng = fyxx.louCeng;           //4
    parameters.fangHao = fyxx.fangHao;           //5
    parameters.huXing = fyxx.huXing;           //6
    parameters.taoNei = fyxx.taoNei;           //7
    parameters.jianZhuMJ = fyxx.jianZhuMJ;           //8
    parameters.tuanGouDJ = fyxx.tuanGouDJ;           //9
    parameters.tuanGouDJ105 = fyxx.tuanGouDJ105;           //10
    parameters.tuanGouZJ = fyxx.tuanGouZJ;           //11
    parameters.tuanGouZJ105 = fyxx.tuanGouZJ105;           //12
    parameters.xuanFangYH0 = fyxx.xuanFangYH0;           //13
    parameters.xuanFangYH1 = fyxx.xuanFangYH1;           //14
    parameters.shiChangYH0 = fyxx.shiChangYH0;           //15
    parameters.shiChangYH1 = fyxx.shiChangYH1;           //16
    parameters.shiDeMJ = fyxx.shiDeMJ;           //17
    parameters.yuanJia0 = fyxx.yuanJia0;           //18
    parameters.yuanJia1 = fyxx.yuanJia1;           //19
    
    parameters.diFangYH0 = fyxx.diFangYH0;       //20
    parameters.diFangYH1 = fyxx.diFangYH1;       //21
    parameters.zaiYH0 = fyxx.zaiYH0;           //22
    parameters.zaiYH1 = fyxx.zaiYH1;           //23
    
    parameters.is_sold = NOT_SOLD;
    
    DzlsInterFaceSoap12BindingResponse *resp = [binding UpdateUsingParameters: parameters];
    
    //返回值
    //resp 包含header bodyParts error;bodyParts 包含【方法名称】Result
    for(id mine in resp.bodyParts){
        if([mine isKindOfClass:[DzlsInterFace_UpdateResponse class]]){
            //  类型转换
            DzlsInterFace_UpdateResponse *response = (DzlsInterFace_UpdateResponse*)mine;
            //  【方法】Result是实体类， 可以直接访问属性；
            returnValue = response.UpdateResult; //return
        }
    }
    return returnValue;
}


@end
