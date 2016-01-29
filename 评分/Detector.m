//
//  Detector.m
//  评分
//
//  Created by ysj on 16/1/27.
//  Copyright © 2016年 newbieYin. All rights reserved.
//

#import "Detector.h"
#import "StudentScore.h"
#import "Student.h"

@implementation Detector
+ (instancetype)sharedDetector{
    static Detector *detector = nil;
    if (!detector) {
        detector = [[Detector alloc] init];
        detector.results = [@[] mutableCopy];
        detector.standardAnswer = @"ABCD";
        detector.ignoredAnswers = @[@2];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.calendar = [NSCalendar currentCalendar];
        components.year = 2016;
        components.month = 1;
        components.day = 29;
        components.hour = 4;
        components.minute = 0;
        components.second = 0;
        detector.startTime = components.date;
    }
    return detector;
}



- (BOOL)detectWithAnswer:(NSString *)stuAnswer{
    
    
    Student *stu = [[Student alloc] init];
    
    stu.time = -_startTime.timeIntervalSinceNow;
    NSString *formatAnswer = nil;
    NSString *answer = nil;
     formatAnswer = [stuAnswer stringByReplacingOccurrencesOfString:@"：" withString:@":"];
    NSArray *infoAndAnswer = [formatAnswer componentsSeparatedByString:@":"];
    
    if (infoAndAnswer.count == 1) {
        NSLog(@"没有名字");
        return NO;
    } else {
        stu.name = infoAndAnswer[0];
        answer = infoAndAnswer[1];
    }
    if (answer.length > self.standardAnswer.length) {
        NSLog(@"答案个数多了%lu个", answer.length - self.standardAnswer.length);
        return NO;
    } else if (answer.length < self.standardAnswer.length){
        NSLog(@"答案个数少了%lu个", -(answer.length - self.standardAnswer.length));
        return NO;
    }
    
    
    
    [self getResult:answer student:stu ignoredAnswers:_ignoredAnswers];
    return YES;
}
- (void)getResult:(NSString *)answer student:(Student *)stu ignoredAnswers:(NSArray*)ignoredAnswers{
    BOOL isIgnoredAnswer;
    NSMutableArray *arr = [@[] mutableCopy];
    for (int i = 0; i < answer.length; i++) {
        isIgnoredAnswer = NO;
        for (NSNumber *num in ignoredAnswers) {
            if ([num intValue] == i + 1) {
                isIgnoredAnswer = YES;
                break;
            }
        }
        if ([answer characterAtIndex:i] != [self.standardAnswer characterAtIndex:i] && !isIgnoredAnswer){
            [arr addObject:@(i +1 )];
        }
    }
    StudentScore *score = [[StudentScore alloc] initWithWrongAnswers:arr];
    score.stu = stu;
    [self.results addObject:score];
}
- (BOOL)writeToFile:(NSString *)path{
    NSMutableString *writeString = [@"" mutableCopy];
    for (StudentScore *score in self.results) {
        [writeString appendString:score.resultString];
        [writeString appendString:@"\n"];
    }
    NSError *error = nil;
    return [writeString writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&error];
}
@end
