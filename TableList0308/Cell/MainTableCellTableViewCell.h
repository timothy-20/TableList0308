//
//  MainTableCellTableViewCell.h
//  TableList0308
//
//  Created by 임정운 on 2021/03/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellMainImg;
@property (weak, nonatomic) IBOutlet UILabel *cellMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellSubLabel;
@property (weak, nonatomic) IBOutlet UIButton *cellMainBtn;

@end

NS_ASSUME_NONNULL_END
