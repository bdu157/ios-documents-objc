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
#import "NSString+WordCount.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *wordCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_contentTextView setDelegate:self];
    
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

#pragma mark - UITextView delegate textViewDidChange
- (void)textViewDidChange:(UITextView *)textView
{
    self.wordCountLabel.text = [NSString stringWithFormat:@"%d%@", self.contentTextView.text.dwp_wordCount, @" Words" ];
}


#pragma mark - Private Methods
-(void)updateViews
{
    if (self.document) {
        self.title = @"Update Document";
        self.titleTextField.text = self.document.title;
        self.contentTextView.text = self.document.content;
        self.wordCountLabel.text = [NSString stringWithFormat:@"%d%@", self.document.content.dwp_wordCount, @" Words"];
    } else {
        self.title = @"Create Document";
        self.wordCountLabel.text = [NSString stringWithFormat:@"%@%@", @"0", @" Words"];
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
