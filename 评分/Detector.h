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
@property (nonatomic, strong)NSMutableDictionary *results;
+ (instancetype)sharedDetector;
- (BOOL)detectWithAnswer:(NSString*)stuAnswer;

@end
