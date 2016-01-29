//
//  Detector.h
//  评分
//
//  Created by ysj on 16/1/27.
//  Copyright © 2016年 newbieYin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Detector : NSObject
@property (nonatomic, strong)NSString *standardAnswer;
@property (nonatomic, strong)NSMutableArray *results;
@property (nonatomic, strong)NSArray *ignoredAnswers;
@property (nonatomic, strong)NSDate *startTime;
+ (instancetype)sharedDetector;
- (BOOL)detectWithAnswer:(NSString*)stuAnswer;
- (BOOL)writeToFile:(NSString*)path;
- (void)sortedByScore;
@end
