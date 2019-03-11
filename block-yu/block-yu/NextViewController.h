//
//  NextViewController.h
//  block-yu
//
//  Created by dev on 16/11/25.
//  Copyright © 2016年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)(NSString *);

@interface NextViewController : UIViewController

//block定义，不能用retain
@property (nonatomic,copy)Block block_back;
@end
