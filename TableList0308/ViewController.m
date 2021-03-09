//
//  ViewController.m
//  TableList0308
//
//  Created by 임정운 on 2021/03/08.
//

#import "ViewController.h"
#import "AddModalViewController.h"

#import "MainTableCellTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *dataArray;
    int counter;
}

@property (weak, nonatomic) IBOutlet UITableView *mainTable;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBtn;

- (IBAction)editBtnAction:(id)sender;
- (IBAction)addBtnAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc] init];
    counter = 1;
    
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    
    [self.mainTable registerNib:[UINib nibWithNibName:@"MainTableCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableCellTableViewCell *cell = [self.mainTable dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}


- (IBAction)addBtnAction:(id)sender {
    [self performSegueWithIdentifier:@"segue1" sender:self];
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:dataArray.count inSection:0];
//    NSArray *indexArray = [NSMutableArray arrayWithObject:indexPath];
//
//    [dataArray addObject:[NSString stringWithFormat:@"%d번째 테이블 셀", counter]];
//    counter++;
//
//    [self.mainTable insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)editBtnAction:(id)sender {
}
@end
