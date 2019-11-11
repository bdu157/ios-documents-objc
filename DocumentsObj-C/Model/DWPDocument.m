//
//  DWPDocument.m
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "DWPDocument.h"
#import "NSString+WordCount.h"


@implementation DWPDocument

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content
{
    self = [super init];
    if (self) {
        _title = title.copy;
        _content = content.copy;
    }
    return self;
}


@end
