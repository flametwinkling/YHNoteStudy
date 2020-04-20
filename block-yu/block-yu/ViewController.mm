//
//  ViewController.m
//  block-yu
//
//  Created by dev on 16/11/24.
//  Copyright © 2016年 YH. All rights reserved.
//

#import "ViewController.h"
#import "Pople.h"
#import "myLabel.h"
#import "NextViewController.h"

#define myInt int
typedef NSString myString;
typedef NSString *(*myss)(int,NSString*);
@interface ViewController ()<MyLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
// mark - 根据c语言引出block,这里主要是针对block的基本用法
    
    
    myInt num = 10;
    myString *str = @"yu";
    NSLog(@"%d %@",num,str);
    myss ms = formers;
    NSLog(@"ms == %@",ms(100,@"ss"));
    
    //block就是C语言的   ^返回值类型(参数){函数的实现}; 变量的赋值
    myBlock = ^void(void){//block的赋值  赋值的时候，｛｝里面的表达式不会被调用 让一个函数指针指向某一个函数
        
        NSLog(@"block 的基本格式");
        
    };
    //调用 声明  赋值   调用
    myBlock();

    
    myBlock = ^(void){//^返回值的类型任何都可以省略
        
        NSLog(@"任何类型的返回值都可以省略,这里省略的是返回值的类型");
    };
    
    myBlock();
    
    
    
    
    myBlock = ^{
        
        NSLog(@"参数的类型为void，那么可以省略，也只有void可以省略，返回值的类型");
    };
    
    //再次调用
    myBlock();
    
    
    yourBlock = ^(int a,int b){//赋值 需要加上变量名
        
        return a + b;
    };
    
    int aBlock = yourBlock(2,4);//调用
    NSLog(@"aBlock = %d",aBlock);

    
    //声明一个拼接字符串的block
    NSString * (^hisBlock)(int , NSString *); //hisBlock变量名 声明
    
    hisBlock = ^(int num,NSString * strBlock){//赋值  在这里省略了返回值 但是参数名必须要带上
        
        return [NSString stringWithFormat:@"%d%@",num,strBlock];
    };
    
    //调用
    NSString *resultBlock = hisBlock(3,@"天3夜");
    NSLog(@"result = %@",resultBlock);
    
    
    
    //typedef类型
    //tepefef  给这个类型起了一个别名   t_block  是类型 是给 NSString * (^)(NSString * , NSString *)起得别名
    typedef   NSString * (^t_block)(NSString * , NSString *);
    
    t_block  hersBlock = ^(NSString *dBlock , NSString *eBlock){//直接给类型进行初始化的赋值
        
        return [NSString stringWithFormat:@"%@,%@",dBlock,eBlock];
    };
    
    NSString *hersResultBlock = hersBlock(@"Come",@"On");
    NSLog(@"hersResultBlock = %@",hersResultBlock);
    
    
    NSLog(@"******new*******\n\n\n");
  
    Pople *pople = [[Pople alloc] init];
    [pople pBlock];

    
    
    
// - mark -界面间的传值
    //1 代理
    myLabel *mylabel = [[myLabel alloc] initWithFrame:CGRectMake(40, 60, 200, 40)];
    mylabel.mylabelDelegate = self;
    [self.view addSubview:mylabel];
    
    //2.block
    mylabel.block = ^{
        NSLog(@"block - 空类型空参数");
    };
    mylabel.Sblock = ^NSString *(NSString *a,NSString *b){
        return [NSString stringWithFormat:@"%@%@",a,b];
    };
    mylabel.Vblock = ^(NSString *a,NSString *b){
        NSLog(@"block - 空类型有参数 a=%@ b=%@",a,b);
    };
    
    UIButton *controllerBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    controllerBtn.backgroundColor = [UIColor yellowColor];
    [controllerBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:controllerBtn];
}




NSString * formers(int a,NSString *str){
    return [NSString stringWithFormat:@"%@%d",str,a];
}


void (^myBlock)(void);//声明的一个block变量

int (^yourBlock)(int ,int );

-(void)nextClick{
    NextViewController *nextVc = [[NextViewController alloc] init];
    nextVc.block_back = ^(NSString *a){
        
        NSLog(@"***返回后的参数 a== %@",a);
    };
    [self presentViewController:nextVc animated:YES completion:nil];

}


#pragma mark - 传值

-(void)myLabelTest{
    NSLog(@"传给代理指令，跳转到另一页");
//    NextViewController *nextVc = [[NextViewController alloc] init];
//    [self presentViewController:nextVc animated:YES completion:^{
//        
//    }];
}

-(void)setTitle:(NSString *)title setColor:(UIColor *)color{
    NSLog(@"传给代理的参数为 title == %@",title);
    NSLog(@"传给代理的参数为 title == %@",title);
    NSLog(@"传给代理的参数为 title == %@",title);
    NSLog(@"传给代理的参数为 title == %@",title);

}

#pragma mark - test
- (void)addGitInfo:(NSString *)info{
    NSLog(@"%s",__func__);
}

@end
