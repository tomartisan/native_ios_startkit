//
//  FSUIDemoViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSUIDemoViewController.h"
#import "FSTestLayoutViewController.h"

@interface FSUIDemoViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FSUIDemoViewController
{
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataArray = @[@[@"满屏填充",@"等边距自适应宽高",@"固定宽高居中",@"指定边距自适应宽高(不一定居中摆放)",@"等屏幕宽或高指定边距居中"],
                   @[@"固定宽高左上",@"固定宽高指定边距左上",@"固定宽高左中",@"固定宽满屏高指定边距左中",@"固定宽高左下",@"固定宽高指定边距左下"],
                   @[@"固定宽高右上",@"固定宽高指定边距右上",@"固定宽高右中",@"固定宽满屏高指定边距右中",@"固定宽高右下",@"固定宽高指定边距右下"],
                   @[@"固定宽高上",@"满屏宽固定高指定边距上",@"固定宽高下",@"满屏宽固定高指定边距下"],
                   @[@"固定宽高，同级控件间相对定位(外部各边上中下、左中右)"]];
    [FSAutolayoutor layView:self.tableView fullOfTheView:self.view];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        return @"中心或局部满屏定位";
    }else if (1 == section){
        return @"左侧定位";
    }else if (2 == section){
        return @"右侧定位";
    }else if (3 == section){
        return @"上下定位";
    }else{
        return @"外部定位";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FSTestLayoutViewController *testUIVC = [[FSTestLayoutViewController alloc] init];
    testUIVC.title = _dataArray[indexPath.section][indexPath.row];
    testUIVC.type = [[NSString stringWithFormat:@"%ld%ld",indexPath.section+1,indexPath.row+1] integerValue];
    [self.navigationController pushViewController:testUIVC animated:YES];
}

clearTableViewSeparator

#pragma mark - getter
- (UITableView *)tableView
{
    if (nil == _tableView) {
        __weak typeof(self) weakSelf = self;
        _tableView = [FSUICreator createTableViewWithSize:CGSizeZero style:UITableViewStyleGrouped rowHeight:40 delegate:weakSelf];
    }
    return _tableView;
}

@end
