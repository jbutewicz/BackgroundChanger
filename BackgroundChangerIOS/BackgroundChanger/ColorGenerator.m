//
//  ColorGenerator.m
//  BackgroundChanger
//
//  Created by Joseph Butewicz on 9/4/14.
//  Copyright (c) 2014 jbutewicz. All rights reserved.
//

#import "ColorGenerator.h"

@interface ColorGenerator()

@end

@implementation ColorGenerator

- (NSMutableArray *)generateNewColor {
    NSNumber *red = [NSNumber numberWithInt:arc4random_uniform(256)];
    NSNumber *green = [NSNumber numberWithInt:arc4random_uniform(256)];
    NSNumber *blue = [NSNumber numberWithInt:arc4random_uniform(256)];
    NSMutableArray *color = [[NSMutableArray alloc] init];
    [color addObject: red];
    [color addObject: green];
    [color addObject: blue];
    return color;
}

- (void)pushColor:(NSMutableArray *)colorArray {
    [colorArray addObject:[self generateNewColor]];
}

- (NSMutableArray *)popColor:(NSMutableArray *)colorArray {
    NSMutableArray *color = [[NSMutableArray alloc] init];
    color = [colorArray objectAtIndex:0];
    [colorArray removeObjectAtIndex:0];
    return color;
}

@end