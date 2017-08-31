//
//  ViewController.m
//  LSProgressIndicator
//
//  Created by wls on 2017/8/31.
//  Copyright © 2017年 wls. All rights reserved.
//

#import "ViewController.h"
#import "LSProgressIndicator.h"

@interface ViewController ()
@property (weak) IBOutlet LSProgressIndicator *testProgressIndicator;
@end
@implementation ViewController

double i = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.testProgressIndicator setFrame:NSMakeRect(80, 138, 220, 20)];
    self.testProgressIndicator.cornerRadius = 10;
}

- (IBAction)testBtnAction:(NSButton *)sender {
    i = 0;
    [NSTimer scheduledTimerWithTimeInterval:1/60.0 target:self selector:@selector(changeProgressValue:) userInfo:nil repeats:YES];

}
-(void)changeProgressValue:(NSTimer *)timer{
    if (i > 100) {
        [timer invalidate];
    }
    int percent = i;
    NSString* string = [NSString stringWithFormat:@"%i", percent];
    string = [string stringByAppendingString:@"%"];
    self.testProgressIndicator.doubleValue = i;
    [self.testProgressIndicator setNeedsDisplay:YES];
    i++;
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
