//
//  AddModalViewController.m
//  TableList0308
//
//  Created by 임정운 on 2021/03/08.
//

#import "AddModalViewController.h"
#import "LabelViewController.h"

@interface AddModalViewController ()<UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSMutableArray *cellLabel;
    NSInteger selectedIndex;
    
    NSArray *data1;
    NSArray *data2;
}

@property (weak, nonatomic) IBOutlet UITableView *modalTable;
@property (weak, nonatomic) IBOutlet UIPickerView *uiPicker;

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
    
    data1 = [NSArray arrayWithObjects:@"커피", @"에이드", nil];
    data2 = [NSArray arrayWithObjects:@"라떼", @"모카", @"아메리카노", @"에스프레소", nil];
    
    self.uiPicker.delegate = self;
    self.uiPicker.dataSource = self;
}

#pragma mark - custom cell

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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

#pragma mark - tablecell selection

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = indexPath.row;
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

#pragma mark - section style

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
//
//    [label setFont:[UIFont boldSystemFontOfSize:12]];
//    NSString *string = [cellLabel objectAtIndex:section];
//
//    [label setText:string];
//    [headerView addSubview:label];
    
    [headerView setBackgroundColor:[UIColor grayColor]];

    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0)];
    
//    footerView.layer.borderColor = [[UIColor grayColor] CGColor];
//    footerView.layer.borderWidth = 1.0;
    
    [footerView setBackgroundColor:[UIColor grayColor]];
    
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

#pragma mark - picker view

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0) {
        return data1.count;
    } else {
        return data2.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0) {
        return [data1 objectAtIndex:row];
    } else {
        return [data2 objectAtIndex:row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    NSLog(@"%d", component);
//    NSLog(@"%d", row);
    
//    if(component == 0 && row == 2) {
//        NSLog(@"this way");
//        NSMutableArray *data1Update = [data1 mutableCopy];
//        data1Update[2] = @"hello";
//
//        data1 = [NSArray arrayWithArray:data1Update];
//        [self.uiPicker reloadAllComponents];
//    }
    
//    data2 = [NSArray arrayWithObjects:@"라뗴", @"모카", @"아메리카노", @"에스프레소", nil];
    
    if(component == 0 && row == 0) {
        NSLog(@"data1's first row");
        
        NSMutableArray *coffeeData = [NSMutableArray arrayWithObjects:@"라떼", @"모카", @"아메리카노", @"에스프레소", nil];
        data2 = [NSArray arrayWithArray:coffeeData];
        
        [self.uiPicker reloadComponent:1];
    } else if (component == 0 && row == 1) {
        NSLog(@"data1's second row");
        
        NSMutableArray *aidData = [NSMutableArray arrayWithObjects:@"레몬 에이드", @"청귤 에이드", @"사과 에이드", nil];
        data2 = [NSArray arrayWithArray:aidData];
        [self.uiPicker reloadComponent:1];
    }
}

#pragma mark - navigation button action

- (IBAction)coffeeAddAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)coffeeCancelAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
