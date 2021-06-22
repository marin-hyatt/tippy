//
//  SettingsViewController.m
//  Tippy
//
//  Created by Marin Hyatt on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (IBAction)changeDefault:(id)sender {
    double tipPercentages[] = {0.15, 0.2, 0.25};
    //Sets default tip percentage as 20%.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble: tipPercentages[self.defaultTipControl.selectedSegmentIndex]
        forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    
    if (doubleValue == 0.15) {
        self.defaultTipControl.selectedSegmentIndex = 0;
    } else if (doubleValue == 0.2) {
        self.defaultTipControl.selectedSegmentIndex = 1;
    } else {
        self.defaultTipControl.selectedSegmentIndex = 2;
    }
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
