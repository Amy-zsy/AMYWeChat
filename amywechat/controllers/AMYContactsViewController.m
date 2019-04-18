//
//  AMYContactsViewController.m
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYContactsViewController.h"
#import "AMYView.h"
#import "AMYDataLoader.h"
#import "AMYContacts.h"
#import "AMYContactGroup.h"

static NSString * const ID = @"CONTACTSVIEWCELL";

@interface AMYContactsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) AMYView *view;
@property (nonatomic, copy) NSArray *data;

@end

@implementation AMYContactsViewController

@dynamic view;

- (void)loadView {
    self.view = [[AMYView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tableview.delegate = self;
    self.view.tableview.dataSource = self;
    self.view.tableview.rowHeight = 50;
    self.view.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01)];

    [self.view.tableview registerClass:UITableViewCell.class forCellReuseIdentifier:ID];
    __weak typeof(self) weakself = self;
    [AMYDataLoader loadJSONFile:@"discovery" completion:^(id jsonObj, NSError *error) {
        if(![jsonObj isKindOfClass:NSArray.class]) {
            return;
        }
        __strong typeof(self) self = weakself;
        self.data = jsonObj;
        [self.view.tableview reloadData];
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AMYContactGroup *group = [[AMYContactGroup alloc] initWithDic:_data[section]];
    return group.content.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    AMYContactGroup *group = [[AMYContactGroup alloc] initWithDic:_data[indexPath.section]];
    AMYContacts *celldata = group.content[indexPath.row];
    cell.textLabel.text = celldata.name;
    NSString *img = celldata.image;
    cell.imageView.image = [UIImage imageNamed:img];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    AMYContactGroup *group = [[AMYContactGroup alloc] initWithDic:_data[section]];
    return group.title;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [_data valueForKeyPath:@"title"];
}


@end
