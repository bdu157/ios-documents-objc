//
//  DetailViewController.h
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DocumentController;
@class DWPDocument;

@interface DetailViewController : UIViewController <UITextViewDelegate>

@property (nonatomic) DocumentController *documentController;
@property (nonatomic) DWPDocument *document;

@property(nonatomic, assign) id<UITextViewDelegate> delegate;

@end


