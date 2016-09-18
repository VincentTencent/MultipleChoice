//
//  ReadJson.m
//  ComsenseHome
//
//  Created by Comsense on 16/7/15.
//  Copyright © 2016年 Comsense. All rights reserved.
//

#import "ReadJson.h"

@implementation ReadJson

+ (id)readJson:(NSString *)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",fileName] ofType:@"json"];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    //==Json数据
    //==JsonObject
    id JsonObject=[NSJSONSerialization JSONObjectWithData:fileData
                                                  options:NSJSONReadingMutableLeaves
                                                    error:&error];
    return JsonObject;
}

@end
