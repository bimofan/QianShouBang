//
//  BaseViewController.m
//  QianShouBang
//
//  Created by Haikun Zhu on 15/7/31.
//  Copyright (c) 2015年 zhuhaikun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    UITapGestureRecognizer *_tapResign;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
     _tapResign = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    
    
    if (self.title.length > 0) {
        
        [self setNavigationTitleColor];
        
        
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboarddidShow) name:UIKeyboardDidShowNotification object:nil];
}

-(void)keyboarddidShow
{
    [self.view addGestureRecognizer:_tapResign];
    
    
}
-(void)hideKeyboard
{
    [self.view endEditing:YES];
    
    [self.view removeGestureRecognizer:_tapResign];
    
}



#pragma mark - 设置title  颜色
-(void)setNavigationTitleColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    self.navigationItem.titleView = label;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Heiti SC" size:18];
    label.backgroundColor = [UIColor clearColor];
    //    label.textColor = [UIColor colorWithRed:0.686 green:0.49 blue:0.231 alpha:1];
    label.textColor = [UIColor whiteColor];
    label.text = self.title;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
