//
//  DocumentController.h
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DWPDocument;

@interface DocumentController : NSObject

@property (nonatomic, readonly, copy) NSArray<DWPDocument *> *documents;

-(void)addDocument:(DWPDocument *)aDocument;
-(void)removeDocument:(DWPDocument *)aDocument;


@end

