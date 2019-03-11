//
//  myLabel.m
//  block-yu
//
//  Created by dev on 16/11/24.
//  Copyright © 2016年 YH. All rights reserved.
//

#import "myLabel.h"

@implementation myLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.text = @"myLabel";
        self.userInteractionEnabled = YES;//打开myLabel的用户交互
        //添加单击手势的事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget: self action:@selector(click)];
        [self addGestureRecognizer:tap];

    }
    return self;
}

-(void)click{
    if ([self.mylabelDelegate respondsToSelector:@selector(myLabelTest)]) {
        [self.mylabelDelegate myLabelTest];
    }
    
    if ([self.mylabelDelegate respondsToSelector:@selector(setTitle:setColor:)]) {
        [self.mylabelDelegate setTitle:@"aa" setColor:[UIColor yellowColor]];
    }
    
    //block
    self.block();
     self.Vblock(@"3",@"4");
    NSLog(@"block - 有类型有参数%@",self.Sblock(@"1",@"2"));
   
}


@end
