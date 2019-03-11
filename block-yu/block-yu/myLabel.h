//
//  myLabel.h
//  block-yu
//
//  Created by dev on 16/11/24.
//  Copyright © 2016年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyLabelDelegate <NSObject>

-(void)myLabelTest;

-(void)setTitle:(NSString *)title setColor:(UIColor *)color;

@end

@interface myLabel : UILabel

@property (nonatomic,retain)id <MyLabelDelegate>mylabelDelegate;



@property (nonatomic,assign) void(^block)(void);

@property (nonatomic,copy) NSString *(^Sblock)(NSString *,NSString *);

@property (nonatomic,copy) void(^Vblock)(NSString *,NSString *);

@end
