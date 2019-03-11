//
//  TestViewController.m
//  block-yu
//
//  Created by dev on 16/11/25.
//  Copyright © 2016年 YH. All rights reserved.
//

#import "TestViewController.h"
#import "HttpConnect.h"

@interface TestViewController ()
{
    HttpConnect *httpConnect;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - 下载
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     httpConnect = [[HttpConnect alloc] initWithUrl:@"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg" sucess:^(NSData *sucessInfo) {
         NSLog(@"%@",sucessInfo);
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
         iv.backgroundColor = [UIColor redColor];
        iv.image = [UIImage imageWithData:sucessInfo];
        [self.view addSubview:iv];
    } faule:^(NSError *faileInfo) {
        NSLog(@"%@",faileInfo);
    }];
}


@end
