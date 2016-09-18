//
//  GuageExamViewController.h
//  Test
//
//  Created by shikun on 16/9/14.
//  Copyright © 2016年 shikun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderList;
@interface MChoiceViewController : UIViewController

@property (nonatomic, strong) OrderList *orderlist;

@property (nonatomic, copy) void(^isFlag)(NSString*);

@end
