//
//  TipViewController.m
//  Tippy
//
//  Created by Marin Hyatt on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello!");
    // Dismisses keyboard
    [self.view endEditing:true];
}
- (IBAction)updateLabels:(id)sender {
    //Calculates tip percentage based on which segment was chosen
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    //Calculates bill, tip, and total.
    double bill = [self.billField.text doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    //Sets tip and total with correctly formatted numbers.
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", total];;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
