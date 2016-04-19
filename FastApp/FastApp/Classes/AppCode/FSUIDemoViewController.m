//
//  FSUIDemoViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSUIDemoViewController.h"

@interface FSUIDemoViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FSUIDemoViewController
{
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataArray = @[@[@"全屏填充",@"等边距自适应宽高",@"固定宽高居中",@"指定边距居中",@"等屏幕宽或高指定边距居中"],
                   @[@"固定宽高左上",@"固定宽高左中",@"固定宽高左下",@"固定宽高指定边距左上",@"固定宽高指定边距右上"],
                   @[@"",@"",@"",@"",@""],
                   @[@"",@"",@"",@"",@""],
                   @[@"",@"",@"",@"",@""]];
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
        return @"中心定位";
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
