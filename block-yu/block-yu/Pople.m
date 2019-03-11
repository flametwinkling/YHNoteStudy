//
//  Pople.m
//  block-yu
//
//  Created by dev on 16/11/24.
//  Copyright © 2016年 YH. All rights reserved.
//

#import "Pople.h"

//预定义
typedef NSString * (^p_block)(NSString *,NSString*);//传入两个字符串，返回字符串,函数名为p_block

@implementation Pople

-(void)pBlock{
    //1
  
//    void (^myblock)(void) = ^void(void){
//        NSLog(@"myblock");
//    };//第一个void是指函数的声明，第二个void是指函数的参数,在重写函数时，这两个void可以省略
 
    void (^myblock)(void) = ^{
        NSLog(@"1 == myblock");
    };
    [self runBlock:myblock];
    
    //2
    
//    NSString *(^myblockStr)(NSString*,int) = ^NSString*(NSString *a,int b){
//        return [NSString stringWithFormat:@"%@%d",a,b];
//    };//可以直接将函数写入调用的方法中，这里不需要声明
    
    [self runStrBlock:^NSString *(NSString *a,int b){
        return [NSString stringWithFormat:@"%@%d",a,b];
    }];
    
    //3
    //用预定义来声明block,p_block pBblock = ^NSString *(NSString *a,NSString *b){}

    p_block  pBblock = ^(NSString *a,NSString *b){
        return [NSString stringWithFormat:@"%@%@",a,b];
    };//这里不需要再加block函数返回的类型声明，因为p_block就是类型
    
    [self runPBlock:pBblock];
}


-(void)runBlock:(void(^)(void))block{
    block();
}

-(void)runStrBlock:(NSString *(^)(NSString*, int ))block{
    NSLog(@"2 == %@",block(@"heh",1));
}

-(void)runPBlock:(NSString *(^)(NSString*,NSString*))block{
    NSLog(@"3 == %@",block(@"yyy",@"hhh"));
}


@end
