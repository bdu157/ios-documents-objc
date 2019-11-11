//
//  DocumentController.m
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "DocumentController.h"
#import "DWPDocument.h"

@interface DocumentController ()

@property (nonatomic) NSMutableArray<DWPDocument *> *internalDocuments;

@end

@implementation DocumentController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalDocuments = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addDocument:(DWPDocument *)aDocument
{
    [self.internalDocuments addObject:aDocument];
}


-(void)removeDocument:(DWPDocument *)aDocument
{
    [self.internalDocuments removeObject:aDocument];
}

//you can use this by accessing DoccumentController in tableViewController
- (NSArray<DWPDocument *> *)documents
{
    return self.internalDocuments.copy;
}

@end
