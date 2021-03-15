//
//  LabelViewController.m
//  TableList0308
//
//  Created by 임정운 on 2021/03/09.
//

#import "LabelViewController.h"

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

-(IBAction)getLabelData:(id)sender
{
    NSLog(@"%@", labelNametext);
    labelNametext =  self.labelName.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
