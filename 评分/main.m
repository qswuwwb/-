//
//  main.m
//  评分
//
//  Created by ysj on 16/1/27.
//  Copyright © 2016年 newbieYin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Detector.h"
#import "StudentScore.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Detector *detector = [Detector sharedDetector];
        [detector detectWithAnswer:@"f:AAfD"];
        [detector.results[@"f"] show];
        
    }
    return 0;
}
