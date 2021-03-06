//
//  PersonCenterTableViewController.m
//  QianShouBang
//
//  Created by Leo on 15/8/5.
//  Copyright (c) 2015年 zhuhaikun. All rights reserved.
//

#import "PersonCenterTableViewController.h"
#import "InfoCell.h"
#import "RowCell.h"
#import "MyPurseTableViewController.h"
#import "RankTVC.h"
#import "SettingTVC.h"
#import "PersonInfoSettingTVC.h"
#import "MallTableViewController.h"
#import "MessageTableViewController.h"


@interface PersonCenterTableViewController ()

@end

@implementation PersonCenterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = kBackgroundColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else {
        return 3;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 15)];
    headView.backgroundColor = [UIColor clearColor];
    
    return headView;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *infoCellId = @"InfoCell";
    InfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellId];
    if (infoCell == nil) {
        infoCell = [[NSBundle mainBundle]loadNibNamed:@"InfoCell" owner:self options:nil][0];
    }
    infoCell.backgroundColor = kContentColor;
    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    static NSString *cellId = @"RowCell";
    
    RowCell *singleCell = [tableView dequeueReusableCellWithIdentifier:cellId ];
    if (singleCell == nil) {
        
        singleCell = [[NSBundle mainBundle]loadNibNamed:@"RowCell" owner:self options:nil][0];
    }
    
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    infoCell.backgroundColor = kContentColor;
                    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
                    //头像
                    infoCell.image.image = [UIImage imageNamed:@"setting"];
                    //姓名
                    infoCell.name.text = @"我的姓名";
                    //电话
                    infoCell.phone.text = @"1522222222";
                    //性别
                    infoCell.sex_image.image = [UIImage imageNamed:@"male"];
                    return infoCell;
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0://兑换牵手币
                {
                    singleCell.extraText.hidden = YES;
                    singleCell.image.image = [UIImage imageNamed:@"money"];
                    singleCell.text.text = @"兑换牵手币";
                    return singleCell;
                    
                }
                    break;
                    
                case 1://我的钱包
                {
                    singleCell.extraText.hidden = NO;
                    singleCell.image.image = [UIImage imageNamed:@"purse"];
                    singleCell.text.text = @"我的钱包";
                    return singleCell;
                    
                }
                    break;
                    
                case 2://牵手币商城
                {
                    singleCell.extraText.hidden = YES;
                    singleCell.image.image = [UIImage imageNamed:@"mall"];
                    singleCell.text.text = @"牵手币商城";
                    return singleCell;
                    
                    
                }
                    break;
                    
                    
                default:
                    break;
            }
            
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0://消息中心
                {
                    singleCell.extraText.hidden = YES;
                    singleCell.image.image = [UIImage imageNamed:@"message_center"];
                    singleCell.text.text = @"消息中心";
                    return singleCell;
                    
                }
                    break;
                    
                case 1://排行榜
                {
                    singleCell.extraText.hidden = YES;
                    singleCell.image.image = [UIImage imageNamed:@"rank"];
                    singleCell.text.text = @"排行榜";
                    return singleCell;
                    
                }
                    break;
                    
                case 2://设置
                {
                    singleCell.extraText.hidden = YES;
                    singleCell.image.image = [UIImage imageNamed:@"setting"];
                    singleCell.text.text = @"设置";
                    return singleCell;
                    
                    
                }
                    break;
                    
                    
                default:
                    break;
            }
            
        }
            break;
            
        default:
            break;
    }
    return nil;
 
    
 
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:kSecondStoryboard bundle:[NSBundle mainBundle]];
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    PersonInfoSettingTVC *personSettingTVC = [sb instantiateViewControllerWithIdentifier:@"PersonInfoSettingTVC"];
                    [self.navigationController pushViewController:personSettingTVC animated:YES];
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0://兑换牵手币
                {
                    self.view.backgroundColor = [UIColor redColor];
                    
                }
                    break;
                    
                case 1://我的钱包
                {
                    MyPurseTableViewController *purseTVC = [sb instantiateViewControllerWithIdentifier:@"MyPurseTableViewController"];
                    [self.navigationController pushViewController:purseTVC animated:YES];
                    
                }
                    break;
                    
                case 2://牵手币商城
                {
                    MallTableViewController *mallTVC = [sb instantiateViewControllerWithIdentifier:@"MallTableViewController"];
                    [self.navigationController pushViewController:mallTVC animated:YES];
                    
                    
                }
                    break;

                    
                default:
                    break;
            }
            
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0://消息中心
                {
                    MessageTableViewController *messageTVC = [sb instantiateViewControllerWithIdentifier:@"MessageTableViewController"];
                    [self.navigationController pushViewController:messageTVC animated:YES];
                    
                }
                    break;
                    
                case 1://排行榜
                {
                    RankTVC *rankTVC = [sb instantiateViewControllerWithIdentifier:@"RankTVC"];
                    [self.navigationController pushViewController:rankTVC animated:YES];
                    
                }
                    break;
                    
                case 2://设置
                {
                    SettingTVC *SettingTVC = [sb instantiateViewControllerWithIdentifier:@"SettingTVC"];
                    [self.navigationController pushViewController:SettingTVC animated:YES];
                    
                    
                }
                    break;
                    
                    
                default:
                    break;
            }
            
        }
            break;
            
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}







@end
