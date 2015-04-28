//
//  NewViewController.m
//  SpecialEventScheduler
//
//  Created by Nathan Bisson on 2015-02-25.
//  Copyright (c) 2015 Nathan Bisson. All rights reserved.
//

#import "NewViewController.h"
#import "Schedule.h"//;

@interface NewViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *descField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePick;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation NewViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if(sender != self.saveButton) return;
    
    if(self.textField.text.length > 0) {
        self.eventItem = [[Schedule alloc] init];
        self.eventItem.eventName = self.textField.text;
        self.eventItem.eventDescription = self.descField.text;
        self.eventItem.eventDate = self.datePick.date;
    }
    
}


@end
