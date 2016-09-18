//
//  GuageExam.h
//  Test
//
//  Created by shikun on 16/9/14.
//  Copyright © 2016年 shikun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuageExam : NSObject

@property (nonatomic, copy) NSString *question;
@property (nonatomic, strong) NSMutableArray *answers;

@property (nonatomic, strong) NSArray *selections;

@property (nonatomic, assign) BOOL isMutSelect;

- (instancetype)initWithDict:(NSDictionary *) dict;

@end
