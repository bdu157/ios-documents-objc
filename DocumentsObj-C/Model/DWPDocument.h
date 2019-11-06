//
//  DWPDocument.h
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWPDocument : NSObject

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

@end


