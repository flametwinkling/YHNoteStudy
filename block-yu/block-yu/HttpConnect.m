//
//  HttpConnect.m
//  block-yu
//
//  Created by dev on 16/11/25.
//  Copyright © 2016年 YH. All rights reserved.
//

#import "HttpConnect.h"

@interface HttpConnect ()
{
    NSURLConnection *_connection;
    NSMutableData *_responseData;
    sucess_b sucessb;
    faile_b  faileb;
}
@end

@implementation HttpConnect


-(id)initWithUrl:(NSString *)urlStr sucess:(sucess_b)sucessInfo faule:(faile_b)faileInfo{
    if (self = [super init]) {
        _responseData = [NSMutableData data];
        sucessb = [sucessInfo copy];
        faileb = [faileInfo copy];

            NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
            _connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
     
    }
    
    return self;
}

#pragma mark - connect func 

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    sucessb(_responseData);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_responseData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    faileb(error);
}




@end
