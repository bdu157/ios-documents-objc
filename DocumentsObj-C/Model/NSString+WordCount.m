//
//  NSString+WordCount.m
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "NSString+WordCount.h"


@implementation NSString (WordCount)

- (int)dwp_wordCount
{
    return (int)[[self componentsSeparatedByString:@" "] count];
}
@end
