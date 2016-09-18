//
//  GuageExamViewController.m
//  Test
//
//  Created by shikun on 16/9/14.
//  Copyright © 2016年 shikun. All rights reserved.
//

#import "SChoiceViewController.h"
#import "GuageExam.h"
#import "ReadJson.h"
#import "GuageExamCell.h"


#define WIDTH  self.view.frame.size.width

@interface SChoiceViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *questionArr;
@property (nonatomic, copy) NSString *manID;
@end

@implementation SChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    NSMutableArray *questionMutArr = [@[] mutableCopy];
    NSArray *tmpArr = [ReadJson readJson:@"health"];
    for (NSDictionary *dict in tmpArr) {
        GuageExam *examModel = [[GuageExam alloc] initWithDict:dict];
        [questionMutArr addObject:examModel];
    }
    _questionArr = questionMutArr;
    [self createTable];
}

- (void)createTable{
    
    self.tableView = ({
        CGRect frame = CGRectMake(0, 0, WIDTH, self.view.frame.size.height-64);
        UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:tableView];
        tableView;
    });
    
}

#pragma mark - Table M

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _questionArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_questionArr[section] selections].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GuageExam *model = _questionArr[section];
    UILabel *titleLabel = [UILabel new];
    titleLabel.backgroundColor = [UIColor whiteColor];
    NSString *title = [NSString stringWithFormat:@"%i.%@",section+1,model.question];
    titleLabel.text = title;
    return titleLabel;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GuageExamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnswerCell"];
    if (!cell) {
        cell = [[GuageExamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AnswerCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    GuageExam *model = _questionArr[indexPath.section];
    cell.optionLabel.text = model.selections[indexPath.row];
  
        cell.imgView.image = [UIImage imageNamed:@"schoice_unchecked"];
        if ([model.answers containsObject:model.selections[indexPath.row]]) {
            cell.imgView.image = [UIImage imageNamed:@"schoice_checked"];
        }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GuageExam *model = _questionArr[indexPath.section];
    [model.answers removeAllObjects];
    [model.answers  addObject:model.selections[indexPath.row]];
    [self.tableView reloadData];
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
