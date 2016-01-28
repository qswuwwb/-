//
//  StudentScore.m
//  评分
//
//  Created by ysj on 16/1/27.
//  Copyright © 2016年 newbieYin. All rights reserved.
//

#import "StudentScore.h"
NSString *standardAnswer = @"ABCD";
@implementation StudentScore
- (NSInteger)score{
    return (1 - (CGFloat)self.wrongAnswers.count / standardAnswer.length) *100;
}

- (instancetype)initWithWrongAnswers:(NSArray *)arr{
    if (self = [super init]) {
        self.wrongAnswers = arr;
    }
    return self;
}
- (void)show{
    NSMutableString *str = [@"" mutableCopy];
    for (NSNumber *n in self.wrongAnswers) {
        [str appendString:[NSString stringWithFormat:@"%@", n]];
        [str appendString:@" "];
    }
    
    NSLog(@"姓名：%@\t用时：%f分\t得分：%ld\t错误题号：%@",self.stu.name, self.stu.time / 60, (long)self.score, str);
}
@end
