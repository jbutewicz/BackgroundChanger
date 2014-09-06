//
//  ChangerViewController.m
//  BackgroundChanger
//
//  Created by Joseph Butewicz on 9/4/14.
//  Copyright (c) 2014 jbutewicz. All rights reserved.
//

#import "ChangerViewController.h"
#import "BackgroundView.h"
#import "ColorGenerator.h"

@interface ChangerViewController ()

@property (strong, nonatomic) IBOutlet BackgroundView *backgroundView;
@property (nonatomic, strong) NSMutableArray *colors; // of colors

@end

@implementation ChangerViewController

float timeInterval = 2.0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.colors = [[NSMutableArray alloc] init];
    [self pushColor];
    [self popColorAndUpdate];
    [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                     target:self
                                   selector:@selector(pushColor)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                     target:self
                                   selector:@selector(popColorAndUpdate)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)pushColor
{
    ColorGenerator *colorGenerator = [[ColorGenerator alloc] init];
    [colorGenerator pushColor:self.colors];
}

-(void)popColorAndUpdate
{
    ColorGenerator *colorGenerator = [[ColorGenerator alloc] init];
    NSMutableArray *color = [[NSMutableArray alloc] init];
    color = [colorGenerator popColor:self.colors];
    self.backgroundView.backgroundColor = [UIColor colorWithRed:[[color objectAtIndex:0] intValue]/255.0 green:[[color objectAtIndex:1] intValue]/255.0 blue:[[color objectAtIndex:2] intValue]/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
