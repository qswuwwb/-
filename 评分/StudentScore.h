//
//  StudentScore.h
//  评分
//
//  Created by ysj on 16/1/27.
//  Copyright © 2016年 newbieYin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface StudentScore : NSObject
@property (nonatomic, assign, readonly)NSInteger score;
@property (nonatomic, strong)NSArray *wrongAnswers;
@property (nonatomic, strong)Student *stu;

- (instancetype)initWithWrongAnswers:(NSArray*)arr;
- (void)show;
@end
