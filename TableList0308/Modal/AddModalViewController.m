//
//  AddModalViewController.m
//  TableList0308
//
//  Created by 임정운 on 2021/03/08.
//

#import "AddModalViewController.h"
#import "LabelViewController.h"

@interface AddModalViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *cellLabel;
    NSInteger selectedIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *modalTable;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *coffeeCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *coffeeAdd;

- (IBAction)coffeeCancelAction:(id)sender;
- (IBAction)coffeeAddAction:(id)sender;

@end

@implementation AddModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    selectedIndex = 0;
    cellLabel = [NSMutableArray arrayWithArray:@[@"레이블", @"개수", @"가격", @"브랜드"]];
    
    self.modalTable.delegate = self;
    self.modalTable.dataSource = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
//
//    [label setFont:[UIFont boldSystemFontOfSize:12]];
//    NSString *string = [cellLabel objectAtIndex:section];
//
//    [label setText:string];
//    [headerView addSubview:label];
//    [headerView setBackgroundColor:[UIColor redColor]];
//
//    return headerView;
//}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1)];
    
    //footerView.layer.borderColor = [[UIColor grayColor] CGColor];
    //footerView.layer.borderWidth = 1.0;
    
    return footerView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellLabel.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setLabel"];
    cell.textLabel.text = cellLabel[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = indexPath.row;
    NSLog(@"%d", indexPath.row);
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(selectedIndex == 0) {
        [self performSegueWithIdentifier:@"labelView" sender:nil];
    } else if (selectedIndex == 1) {
        [self performSegueWithIdentifier:@"numberView" sender:nil];
    } else if (selectedIndex == 2) {
        [self performSegueWithIdentifier:@"priceView" sender:nil];
    } else if (selectedIndex == 3) {
        [self performSegueWithIdentifier:@"brandView" sender:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (IBAction)coffeeAddAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)coffeeCancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
