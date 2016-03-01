#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class DzlsInterFace_HelloWorld;
@class DzlsInterFace_HelloWorldResponse;
@class DzlsInterFace_GetModel;
@class DzlsInterFace_GetModelResponse;
@class DzlsInterFace_Local_HousingResources;
@class DzlsInterFace_GetList;
@class DzlsInterFace_GetListResponse;
@class DzlsInterFace_ArrayOfLocal_HousingResources;
@class DzlsInterFace_Update;
@class DzlsInterFace_UpdateResponse;
@interface DzlsInterFace_HelloWorld : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_HelloWorld *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_HelloWorldResponse : NSObject {
	
/* elements */
	NSString * HelloWorldResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_HelloWorldResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * HelloWorldResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_GetModel : NSObject {
	
/* elements */
	NSString * xuhao;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_GetModel *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * xuhao;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_Local_HousingResources : NSObject {
	
/* elements */
	NSString * is_sold;
	NSNumber * xuHao;
	NSString * dongHao;
	NSString * danYuan;
	NSString * louCeng;
	NSString * fangHao;
	NSString * huXing;
	NSString * taoNei;
	NSString * jianZhuMJ;
	NSString * tuanGouDJ;
	NSString * tuanGouDJ105;
	NSString * tuanGouZJ;
	NSString * tuanGouZJ105;
	NSString * xuanFangYH0;
	NSString * xuanFangYH1;
	NSString * shiChangYH0;
	NSString * shiChangYH1;
	NSString * shiDeMJ;
	NSString * yuanJia0;
	NSString * yuanJia1;
	NSString * diFangYH0;
	NSString * diFangYH1;
	NSString * zaiYH0;
	NSString * zaiYH1;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_Local_HousingResources *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * is_sold;
@property (retain) NSNumber * xuHao;
@property (retain) NSString * dongHao;
@property (retain) NSString * danYuan;
@property (retain) NSString * louCeng;
@property (retain) NSString * fangHao;
@property (retain) NSString * huXing;
@property (retain) NSString * taoNei;
@property (retain) NSString * jianZhuMJ;
@property (retain) NSString * tuanGouDJ;
@property (retain) NSString * tuanGouDJ105;
@property (retain) NSString * tuanGouZJ;
@property (retain) NSString * tuanGouZJ105;
@property (retain) NSString * xuanFangYH0;
@property (retain) NSString * xuanFangYH1;
@property (retain) NSString * shiChangYH0;
@property (retain) NSString * shiChangYH1;
@property (retain) NSString * shiDeMJ;
@property (retain) NSString * yuanJia0;
@property (retain) NSString * yuanJia1;
@property (retain) NSString * diFangYH0;
@property (retain) NSString * diFangYH1;
@property (retain) NSString * zaiYH0;
@property (retain) NSString * zaiYH1;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_GetModelResponse : NSObject {
	
/* elements */
	DzlsInterFace_Local_HousingResources * GetModelResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_GetModelResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) DzlsInterFace_Local_HousingResources * GetModelResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_GetList : NSObject {
	
/* elements */
	NSString * where;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_GetList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * where;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_ArrayOfLocal_HousingResources : NSObject {
	
/* elements */
	NSMutableArray *Local_HousingResources;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_ArrayOfLocal_HousingResources *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
- (void)addLocal_HousingResources:(DzlsInterFace_Local_HousingResources *)toAdd;
@property (readonly) NSMutableArray * Local_HousingResources;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_GetListResponse : NSObject {
	
/* elements */
	DzlsInterFace_ArrayOfLocal_HousingResources * GetListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_GetListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) DzlsInterFace_ArrayOfLocal_HousingResources * GetListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_Update : NSObject {
	
/* elements */
	NSString * donghao;
	NSString * danYuan;
	NSString * louCeng;
	NSString * fangHao;
	NSString * huXing;
	NSString * taoNei;
	NSString * jianZhuMJ;
	NSString * tuanGouDJ;
	NSString * tuanGouDJ105;
	NSString * tuanGouZJ;
	NSString * tuanGouZJ105;
	NSString * xuanFangYH0;
	NSString * xuanFangYH1;
	NSString * shiChangYH0;
	NSString * shiChangYH1;
	NSString * shiDeMJ;
	NSString * yuanJia0;
	NSString * yuanJia1;
	NSString * diFangYH0;
	NSString * diFangYH1;
	NSString * zaiYH0;
	NSString * zaiYH1;
	NSString * xuHao;
	NSString * is_sold;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_Update *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * donghao;
@property (retain) NSString * danYuan;
@property (retain) NSString * louCeng;
@property (retain) NSString * fangHao;
@property (retain) NSString * huXing;
@property (retain) NSString * taoNei;
@property (retain) NSString * jianZhuMJ;
@property (retain) NSString * tuanGouDJ;
@property (retain) NSString * tuanGouDJ105;
@property (retain) NSString * tuanGouZJ;
@property (retain) NSString * tuanGouZJ105;
@property (retain) NSString * xuanFangYH0;
@property (retain) NSString * xuanFangYH1;
@property (retain) NSString * shiChangYH0;
@property (retain) NSString * shiChangYH1;
@property (retain) NSString * shiDeMJ;
@property (retain) NSString * yuanJia0;
@property (retain) NSString * yuanJia1;
@property (retain) NSString * diFangYH0;
@property (retain) NSString * diFangYH1;
@property (retain) NSString * zaiYH0;
@property (retain) NSString * zaiYH1;
@property (retain) NSString * xuHao;
@property (retain) NSString * is_sold;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface DzlsInterFace_UpdateResponse : NSObject {
	
/* elements */
	NSString * UpdateResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (DzlsInterFace_UpdateResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * UpdateResult;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "DzlsInterFace.h"
@class DzlsInterFaceSoapBinding;
@class DzlsInterFaceSoap12Binding;
@interface DzlsInterFace : NSObject {
	
}
+ (DzlsInterFaceSoapBinding *)DzlsInterFaceSoapBinding;
+ (DzlsInterFaceSoap12Binding *)DzlsInterFaceSoap12Binding;
@end
@class DzlsInterFaceSoapBindingResponse;
@class DzlsInterFaceSoapBindingOperation;
@protocol DzlsInterFaceSoapBindingResponseDelegate <NSObject>
- (void) operation:(DzlsInterFaceSoapBindingOperation *)operation completedWithResponse:(DzlsInterFaceSoapBindingResponse *)response;
@end
@interface DzlsInterFaceSoapBinding : NSObject <DzlsInterFaceSoapBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(DzlsInterFaceSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (DzlsInterFaceSoapBindingResponse *)HelloWorldUsingParameters:(DzlsInterFace_HelloWorld *)aParameters ;
- (void)HelloWorldAsyncUsingParameters:(DzlsInterFace_HelloWorld *)aParameters  delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)responseDelegate;
- (DzlsInterFaceSoapBindingResponse *)GetModelUsingParameters:(DzlsInterFace_GetModel *)aParameters ;
- (void)GetModelAsyncUsingParameters:(DzlsInterFace_GetModel *)aParameters  delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)responseDelegate;
- (DzlsInterFaceSoapBindingResponse *)GetListUsingParameters:(DzlsInterFace_GetList *)aParameters ;
- (void)GetListAsyncUsingParameters:(DzlsInterFace_GetList *)aParameters  delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)responseDelegate;
- (DzlsInterFaceSoapBindingResponse *)UpdateUsingParameters:(DzlsInterFace_Update *)aParameters ;
- (void)UpdateAsyncUsingParameters:(DzlsInterFace_Update *)aParameters  delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)responseDelegate;
@end
@interface DzlsInterFaceSoapBindingOperation : NSOperation {
	DzlsInterFaceSoapBinding *binding;
	DzlsInterFaceSoapBindingResponse *response;
	id<DzlsInterFaceSoapBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) DzlsInterFaceSoapBinding *binding;
@property (readonly) DzlsInterFaceSoapBindingResponse *response;
@property (nonatomic, assign) id<DzlsInterFaceSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(DzlsInterFaceSoapBinding *)aBinding delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)aDelegate;
@end
@interface DzlsInterFaceSoapBinding_HelloWorld : DzlsInterFaceSoapBindingOperation {
	DzlsInterFace_HelloWorld * parameters;
}
@property (retain) DzlsInterFace_HelloWorld * parameters;
- (id)initWithBinding:(DzlsInterFaceSoapBinding *)aBinding delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_HelloWorld *)aParameters
;
@end
@interface DzlsInterFaceSoapBinding_GetModel : DzlsInterFaceSoapBindingOperation {
	DzlsInterFace_GetModel * parameters;
}
@property (retain) DzlsInterFace_GetModel * parameters;
- (id)initWithBinding:(DzlsInterFaceSoapBinding *)aBinding delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_GetModel *)aParameters
;
@end
@interface DzlsInterFaceSoapBinding_GetList : DzlsInterFaceSoapBindingOperation {
	DzlsInterFace_GetList * parameters;
}
@property (retain) DzlsInterFace_GetList * parameters;
- (id)initWithBinding:(DzlsInterFaceSoapBinding *)aBinding delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_GetList *)aParameters
;
@end
@interface DzlsInterFaceSoapBinding_Update : DzlsInterFaceSoapBindingOperation {
	DzlsInterFace_Update * parameters;
}
@property (retain) DzlsInterFace_Update * parameters;
- (id)initWithBinding:(DzlsInterFaceSoapBinding *)aBinding delegate:(id<DzlsInterFaceSoapBindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_Update *)aParameters
;
@end
@interface DzlsInterFaceSoapBinding_envelope : NSObject {
}
+ (DzlsInterFaceSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface DzlsInterFaceSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
@class DzlsInterFaceSoap12BindingResponse;
@class DzlsInterFaceSoap12BindingOperation;
@protocol DzlsInterFaceSoap12BindingResponseDelegate <NSObject>
- (void) operation:(DzlsInterFaceSoap12BindingOperation *)operation completedWithResponse:(DzlsInterFaceSoap12BindingResponse *)response;
@end
@interface DzlsInterFaceSoap12Binding : NSObject <DzlsInterFaceSoap12BindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(DzlsInterFaceSoap12BindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (DzlsInterFaceSoap12BindingResponse *)HelloWorldUsingParameters:(DzlsInterFace_HelloWorld *)aParameters ;
- (void)HelloWorldAsyncUsingParameters:(DzlsInterFace_HelloWorld *)aParameters  delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)responseDelegate;
- (DzlsInterFaceSoap12BindingResponse *)GetModelUsingParameters:(DzlsInterFace_GetModel *)aParameters ;
- (void)GetModelAsyncUsingParameters:(DzlsInterFace_GetModel *)aParameters  delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)responseDelegate;
- (DzlsInterFaceSoap12BindingResponse *)GetListUsingParameters:(DzlsInterFace_GetList *)aParameters ;
- (void)GetListAsyncUsingParameters:(DzlsInterFace_GetList *)aParameters  delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)responseDelegate;
- (DzlsInterFaceSoap12BindingResponse *)UpdateUsingParameters:(DzlsInterFace_Update *)aParameters ;
- (void)UpdateAsyncUsingParameters:(DzlsInterFace_Update *)aParameters  delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)responseDelegate;
@end
@interface DzlsInterFaceSoap12BindingOperation : NSOperation {
	DzlsInterFaceSoap12Binding *binding;
	DzlsInterFaceSoap12BindingResponse *response;
	id<DzlsInterFaceSoap12BindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) DzlsInterFaceSoap12Binding *binding;
@property (readonly) DzlsInterFaceSoap12BindingResponse *response;
@property (nonatomic, assign) id<DzlsInterFaceSoap12BindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(DzlsInterFaceSoap12Binding *)aBinding delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)aDelegate;
@end
@interface DzlsInterFaceSoap12Binding_HelloWorld : DzlsInterFaceSoap12BindingOperation {
	DzlsInterFace_HelloWorld * parameters;
}
@property (retain) DzlsInterFace_HelloWorld * parameters;
- (id)initWithBinding:(DzlsInterFaceSoap12Binding *)aBinding delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_HelloWorld *)aParameters
;
@end
@interface DzlsInterFaceSoap12Binding_GetModel : DzlsInterFaceSoap12BindingOperation {
	DzlsInterFace_GetModel * parameters;
}
@property (retain) DzlsInterFace_GetModel * parameters;
- (id)initWithBinding:(DzlsInterFaceSoap12Binding *)aBinding delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_GetModel *)aParameters
;
@end
@interface DzlsInterFaceSoap12Binding_GetList : DzlsInterFaceSoap12BindingOperation {
	DzlsInterFace_GetList * parameters;
}
@property (retain) DzlsInterFace_GetList * parameters;
- (id)initWithBinding:(DzlsInterFaceSoap12Binding *)aBinding delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_GetList *)aParameters
;
@end
@interface DzlsInterFaceSoap12Binding_Update : DzlsInterFaceSoap12BindingOperation {
	DzlsInterFace_Update * parameters;
}
@property (retain) DzlsInterFace_Update * parameters;
- (id)initWithBinding:(DzlsInterFaceSoap12Binding *)aBinding delegate:(id<DzlsInterFaceSoap12BindingResponseDelegate>)aDelegate
	parameters:(DzlsInterFace_Update *)aParameters
;
@end
@interface DzlsInterFaceSoap12Binding_envelope : NSObject {
}
+ (DzlsInterFaceSoap12Binding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface DzlsInterFaceSoap12BindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
