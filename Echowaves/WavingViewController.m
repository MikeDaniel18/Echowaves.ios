//
//  EchowavesViewController.m
//  Echowaves
//
//  Created by Dmitry on 10/6/13.
//  Copyright (c) 2013 Echowaves. All rights reserved.
//

#import "WavingViewController.h"
#import "EWWave.h"
#import "EWImage.h"

@interface WavingViewController ()

@property (weak, nonatomic) IBOutlet UIButton *photoButton;

@end


@implementation WavingViewController


- (IBAction)wavingChanged:(id)sender {
    NSLog(@"=======waving changed to: %d", self.waving.on);
    
    if(self.waving.on) {
        NSLog(@"======== reset lastCheckTime");
        [USER_DEFAULTS setObject:[NSDate date] forKey:@"lastCheckTime"];
        [USER_DEFAULTS synchronize];
    } else {

    }
    
    [USER_DEFAULTS setBool:self.waving.on forKey:@"waving"];
    [USER_DEFAULTS synchronize];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    APP_DELEGATE.wavingViewController = self;
    self.delegate = self;
    NSLog(@"=======waving initializing was %d changed to: %d", self.waving.on, [USER_DEFAULTS boolForKey:@"waving"]);
    self.waving.on = [USER_DEFAULTS boolForKey:@"waving"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if([self checkedAtload] == false) {
        self.checkedAtload = true;
        [APP_DELEGATE checkForUpload];
    }
}

-(void) pictureSaved
{
//    [self checkForNewImages];
    [APP_DELEGATE checkForUpload];
}



@end
