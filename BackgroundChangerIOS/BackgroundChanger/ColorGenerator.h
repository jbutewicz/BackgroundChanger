//
//  ColorGenerator.h
//  BackgroundChanger
//
//  Created by Joseph Butewicz on 9/4/14.
//  Copyright (c) 2014 jbutewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorGenerator : NSObject

- (NSMutableArray *)generateNewColor;
- (void)pushColor:(NSMutableArray *)colorArray;
- (NSMutableArray *)popColor:(NSMutableArray *)colorArray;

@end
