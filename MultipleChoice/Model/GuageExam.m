//
//  GuageExam.m
//  Test
//
//  Created by shikun on 16/9/14.
//  Copyright © 2016年 shikun. All rights reserved.
//

#import "GuageExam.h"

@implementation GuageExam

- (instancetype)initWithDict:(NSDictionary *) dict {
    self = [super init];
    if (self) {
        self.question = dict[@"project"];
        self.selections = dict[@"result"];//选项
        self.answers = [@[] mutableCopy];
        self.isMutSelect = NO;
        if (dict[@"slectionStyle"]) {
            self.isMutSelect = YES;
        }
    }
    return self;
}
@end
