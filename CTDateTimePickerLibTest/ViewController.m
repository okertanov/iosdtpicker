//
//  ViewController.m
//  CTDateTimePickerLibTest
//
//  Created by Oleg Kertanov on 13/11/15.
//  Copyright © 2015 CTCo. All rights reserved.
//

#import "ViewController.h"
#import "CTDateTimePicker/CTDateTimePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* htmlString = [[NSString alloc] init];
    [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]
                                     options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                               NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                          documentAttributes:nil error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onPickDateButton:(UIButton *)sender forEvent:(UIEvent *)event {
    CTDateTimePicker* dtPicker = [[CTDateTimePicker alloc] init];
    NSLog(@"CTDateTimePicker instance: %@", dtPicker);
    
    NSString* dtModule = [dtPicker module];
    NSLog(@"CTDateTimePicker module: %@", dtModule);
    
    NSDate* currentDate = [dtPicker currentDate];
    NSLog(@"CTDateTimePicker current date is: %@, last selected date is: %@", currentDate, [dtPicker lastSelectedDate]);
    
    CTCompletionActionBlock onComplete = ^void(NSDate* selectedDate) {
        NSLog(@"CTDateTimePicker selected date is: %@, last selected date is: %@", selectedDate, [dtPicker lastSelectedDate]);
        NSString* dateString = [NSDateFormatter localizedStringFromDate:selectedDate
                                                              dateStyle:NSDateFormatterShortStyle
                                                              timeStyle:NSDateFormatterShortStyle];
        [self.dateLabel setText: dateString];
    };
    
    id dtSelectionController = [dtPicker show:self withPresenter:self completeAction:onComplete];
    NSLog(@"CTDateTimePicker shown: %@, selection controller: %@", @"OK", dtSelectionController);
    
    dtPicker = nil;
    NSLog(@"CTDateTimePicker instance: %@", dtPicker);
}

@end
