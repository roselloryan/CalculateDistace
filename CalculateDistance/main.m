//
//  main.m
//  CalculateDistance


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        (25, 4) (1, -6)
//        (47, 43) (-25, -11)
        NSArray *inputsArray = [NSArray arrayWithObjects:@"(34, -88) (10, -56)", @"(-57, -13) (-43, 35)", @"(25, 4) (1, -6)", @"(-22, -68) (-27, -56)", @"(49, -64) (-8, 12)", @"(-47, -32) (16, -16)", @"(-79, 54) (-40, -26)", @"(-41, -80) (-9, -56)", @"(-57, 64) (-21, 37)", nil];
        
        for (NSString *line in inputsArray) {
        
        // extract coordinates from string input
            NSArray *componentsArray = [line componentsSeparatedByString:@") ("];
            NSString *p1CoordinatesPlusCrap = [componentsArray objectAtIndex:0];
            NSString *p2CoordinatesPlusCrap = [componentsArray objectAtIndex:1];
            NSArray *p1Coordinates = [p1CoordinatesPlusCrap componentsSeparatedByString:@", "];
            NSArray *p2Coordinates = [p2CoordinatesPlusCrap componentsSeparatedByString:@", "];
            NSMutableString *x1 = [[p1Coordinates objectAtIndex:0] mutableCopy];;
            NSMutableString *y1 = [p1Coordinates objectAtIndex:1];
            NSMutableString *x2 = [p2Coordinates objectAtIndex:0];
            NSMutableString *y2 = [[p2Coordinates objectAtIndex:1] mutableCopy];
            NSRange x1FirstParenthesesRange = NSMakeRange(0, 1);
            [x1 deleteCharactersInRange:x1FirstParenthesesRange];
            NSRange y2LastParenthesesRange = NSMakeRange(y2.length - 1, 1);
            [y2 deleteCharactersInRange:y2LastParenthesesRange];
        
            // now for calculations
            NSInteger xDistance = [x1 integerValue] - [x2 integerValue];
            NSInteger yDistance = [y1 integerValue] - [y2 integerValue];
            
            if (xDistance < 0) {
                xDistance = -xDistance;
            }
//        NSLog(@"xDistance:%ld",xDistance);
            if (xDistance < 0) {
                yDistance = -yDistance;
            }
//        NSLog(@"yDistance:%ld", yDistance);
    
            // where's pythagorean when you need him xDist2 + yDist2 = distance
        
            NSInteger squaredDistance = xDistance * xDistance + yDistance * yDistance;
    
            NSInteger i = 0;
            for (i = 1; i < squaredDistance/2; i++) {
            
                // find square root without sqrt()
                if (i * i == squaredDistance) {
                    NSLog(@"distance: %ld", i);
                }
            }
        }

    }
    return 0;
}
