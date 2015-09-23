//
//  ViewController.m
//  ToastForIOS
//
//  Created by zhanglei on 15/9/23.
//  Copyright © 2015年 lei.zhang. All rights reserved.
//

#define UI_SCREEN_WIDTH                    ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT                   ([[UIScreen mainScreen] bounds].size.height)
#define UI_DeviceSystemVersion             [[UIDevice currentDevice].systemVersion intValue]

#import "ViewController.h"
#import "ToastForIOS.h"
#import "Toast+UIView.h"
#import "ToastDisplay.h"
@interface ViewController ()
{
    UIButton * btnShowToast1;
    UIButton * btnShowToast2;
    UIButton * btnShowToast3;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor grayColor]];
    UIView * top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, 60)];
    [top setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:top];
    
    UILabel * lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, UI_SCREEN_WIDTH, 40)];
    [lblTitle setText:@"模仿Android的Toast功能"];
    [lblTitle setTextColor:[UIColor redColor]];
    [lblTitle setTextAlignment:NSTextAlignmentCenter];
    [lblTitle setFont:[UIFont systemFontOfSize:20]];
    [self.view addSubview:lblTitle];
    
    btnShowToast1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, UI_SCREEN_WIDTH-40, 40)];
    [btnShowToast1 setBackgroundColor:[UIColor redColor]];
    [btnShowToast1 setTitle:@"展示Toast1" forState:UIControlStateNormal];
    [btnShowToast1 addTarget:self action:@selector(showToast1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShowToast1];
    
    btnShowToast2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 260, UI_SCREEN_WIDTH-40, 40)];
    [btnShowToast2 setBackgroundColor:[UIColor redColor]];
    [btnShowToast2 setTitle:@"展示Toast2" forState:UIControlStateNormal];
    [btnShowToast2 addTarget:self action:@selector(showToast2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShowToast2];
    
    btnShowToast3 = [[UIButton alloc] initWithFrame:CGRectMake(20, 320, UI_SCREEN_WIDTH-40, 40)];
    [btnShowToast3 setBackgroundColor:[UIColor redColor]];
    [btnShowToast3 setTitle:@"展示Toast3" forState:UIControlStateNormal];
    [btnShowToast3 addTarget:self action:@selector(showToast3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShowToast3];
}
/**
 *Toast展示方式1 在展示前全部添加到展示队列 然后最后调用展示方法 并且添加了全部展示完毕的回调方法
 */
-(void)showToast1:(id)sender{
    [[ToastForIOS sharedToastForIOS] initialToastWithMessage:@"模仿android的Toast功能1—1"];
    [[ToastForIOS sharedToastForIOS] initialToastWithMessage:@"模仿android的Toast功能1—2"];
    [[ToastForIOS sharedToastForIOS] showToast:^{
        
    } superView:self.view];
}

/**
 *Toast展示方式2 分别调用 但是没有顺序关系 分别可以调用 没有回调方法
 */
-(void)showToast2:(id)sender{
    [self.view makeToast:@"模仿android的Toast功能2-1" duration:1 position:@"center" image:nil withTextColor:[UIColor whiteColor] withValue:@""];
    [self.view makeToast:@"模仿android的Toast功能2-2" duration:1 position:@"center" image:nil withTextColor:[UIColor whiteColor] withValue:@""];
}

/**
 *Toast展示方式3 分别调用 有顺序关系 并且位置是不断改变 没有回调方法 但是由于是按照顺序的 可以添加block回调
 */
-(void)showToast3:(id)sender{
    [ToastDisplay showToast:@"模仿android的Toast功能3-1" withColorType:1 superView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
