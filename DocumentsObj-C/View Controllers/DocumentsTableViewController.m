//
//  DocumentsTableViewController.m
//  DocumentsObj-C
//
//  Created by Dongwoo Pae on 11/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "DocumentsTableViewController.h"
#import "DWPDocument.h"
#import "DocumentController.h"
#import "DetailViewController.h"
#import "NSString+WordCount.h"

@interface DocumentsTableViewController ()

@property (nonatomic, readonly) DocumentController *documentController;

@end

@implementation DocumentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.documentController.documents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    DWPDocument *document = [self.documentController.documents objectAtIndex:indexPath.row];
    cell.textLabel.text = document.title;
    cell.detailTextLabel.text = document.content;
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DWPDocument *document = [self.documentController.documents objectAtIndex:indexPath.row];
        [self.documentController removeDocument:document];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToUpdateDocument"]) {
        NSIndexPath *selectedRow = self.tableView.indexPathForSelectedRow;
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.documentController = self.documentController;
        detailVC.document = [self.documentController.documents objectAtIndex:selectedRow.row];
    } else if ([segue.identifier isEqualToString:@"ToCreateDocument"]) {
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.documentController = self.documentController;
    }
}

#pragma mark - Private Properties

@synthesize documentController = _documentController;
-(DocumentController *)documentController
{
    if (!_documentController) {
        _documentController = [[DocumentController alloc] init];
    }
    return _documentController;
}

@end
