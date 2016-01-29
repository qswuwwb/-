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
        while (1) {
            Detector *detector = [Detector sharedDetector];
            NSLog(@"请输入学生答案：");
            NSString *inputAnswer = [[NSString alloc] initWithData:[NSFileHandle fileHandleWithStandardInput].availableData encoding:NSUTF8StringEncoding];
            inputAnswer = [inputAnswer stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if ([detector detectWithAnswer:inputAnswer]) {
                 NSLog(@"%@", [detector.results[0] resultString]);
                [detector sortedByScore];
                if ([detector writeToFile:@"/Users/ysj/Desktop/result"]){
                    NSLog(@"保存成功");
                } else {
                    NSLog(@"保存失败");
                };
            }
            
        }
        
    }
    return 0;
}
