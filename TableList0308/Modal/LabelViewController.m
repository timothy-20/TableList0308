//
//  LabelViewController.m
//  TableList0308
//
//  Created by 임정운 on 2021/03/09.
//

#import "LabelViewController.h"
#import "AddModalViewController.h"

@interface LabelViewController ()
{
    NSString *labelNametext;
}
@property (weak, nonatomic) IBOutlet UITextField *labelName;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *insertBtn;

@end

@implementation LabelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.title = @"취소";
//    self.navigationItem.backBarButtonItem = backItem;
//}

//작동 안함.

-(IBAction)getLabelData:(id)sender
{
    NSLog(@"%@", labelNametext);
    
    labelNametext =  self.labelName.text;
    
}

@end
