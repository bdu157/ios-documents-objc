//
//  DetailViewController.m
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "DetailViewController.h"
#import "DocumentController.h"
#import "DWPDocument.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *wordCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
}

- (IBAction)save:(id)sender
{
    BOOL isNewDocument = (self.document == nil);
    
    if (isNewDocument) {
        DWPDocument *document = [[DWPDocument alloc] initWithTitle:self.titleTextField.text content:self.contentTextView.text];
        [self.documentController addDocument:document];
    } else {
        self.document.title = self.titleTextField.text;
        self.document.content = self.contentTextView.text;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Private Methods
-(void)updateViews
{
    if (self.document) {
        self.title = @"Update Document";
        self.titleTextField.text = self.document.title;
        self.contentTextView.text = self.document.content;
    } else {
        self.title = @"Create Document";
    }
}

-(void)setDocument:(DWPDocument *)document
{
    if (_document != document) {
        _document = document;
        [self updateViews];
    }
}

@end
