//
//  NSArray+LocalPrint.m
//
//  Created by xiaotei on 15/8/17.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "NSArray+LocalPrint.h"

@implementation NSArray (LocalPrint)
-(NSString*)descriptionWithLocale:(id)locale{
    //拼接新的array打印字符串
    NSMutableString* tmpStr = [NSMutableString string];
    
    [tmpStr setString:@"(\n"];
    for (id obj in self) {
        NSString * str = [obj description];
        [tmpStr appendFormat:@"\t%@\n",str];
    }
    [tmpStr appendString:@")"];
    return tmpStr;
}
@end
