//
//  HttpConnect.h
//  block-yu
//
//  Created by dev on 16/11/25.
//  Copyright © 2016年 YH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpConnect : NSObject<NSURLConnectionDataDelegate>

typedef void (^sucess_b)(NSData *sucessInfo);

typedef void (^faile_b)(NSError *faileInfo);

-(id)initWithUrl:(NSString *)urlStr sucess:(sucess_b)sucessInfo faule:(faile_b)faileInfo;

@end
