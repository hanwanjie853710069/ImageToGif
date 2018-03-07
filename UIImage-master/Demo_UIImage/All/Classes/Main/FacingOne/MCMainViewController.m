//
//  MCMainViewController.m
//  Demo_Animation
//
//  Created by goulela on 16/10/8.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCMainViewController.h"

#import "Masonry.h"

#import "MCClassOne_mainViewController.h"
#import "MCClassTwo_mainViewController.h"
#import "MCClassThree_mainViewController.h"
#import "MCClassFour_mainViewController.h"

@interface MCMainViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArrayM;

@end

@implementation MCMainViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTableView];
    
    [self createData];
}


#pragma mark - 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * idetifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    
    cell.textLabel.text = self.dataArrayM[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MCClassOne_mainViewController * mainViewController = [[MCClassOne_mainViewController alloc] init];
        [self.navigationController pushViewController:mainViewController animated:YES];

    } else if (indexPath.row == 1) {
    
        MCClassTwo_mainViewController * mainViewController = [[MCClassTwo_mainViewController alloc] init];
        [self.navigationController pushViewController:mainViewController animated:YES];
    } else if (indexPath.row == 2) {
    
        MCClassThree_mainViewController * mainViewController = [[MCClassThree_mainViewController alloc] init];
        [self.navigationController pushViewController:mainViewController animated:YES];
    } else if (indexPath.row == 3) {
    
        MCClassFour_mainViewController * mainViewController = [[MCClassFour_mainViewController alloc] init];
        [self.navigationController pushViewController:mainViewController animated:YES];
    }
}

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"UIImage";
    
}

- (void)addTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)createData
{
    NSArray * array = @[@"UIImage上下文",@"图片类型转换/图片拉伸",@"Gif",@"UIImage的方向(imageOrientation)"];
    
    self.dataArrayM = [NSMutableArray arrayWithArray:array];
    
    [self.tableView reloadData];
}

#pragma mark - setter & getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArrayM
{
    if (!_dataArrayM)
    {
        self.dataArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArrayM;
}

@end
