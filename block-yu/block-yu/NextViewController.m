//
//  NextViewController.m
//  block-yu
//
//  Created by dev on 16/11/25.
//  Copyright © 2016年 YH. All rights reserved.
//

#import "NextViewController.h"
#import "TestViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.block_back(@"返回值");
    
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    
    //test
    [self presentViewController:[[TestViewController alloc] init] animated:YES completion:^{
        
    }];
    

}


@end
