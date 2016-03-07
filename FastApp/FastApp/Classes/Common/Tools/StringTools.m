//
//  StringTools.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "StringTools.h"

@implementation StringTools

+ (NSString *)uuid
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef cfStr = CFUUIDCreateString(NULL, uuid);
    
    NSString *ret = [NSString stringWithString:(__bridge NSString *)cfStr];
    
    CFRelease(uuid);
    CFRelease(cfStr);
    
    return ret;
}

//编码
+ (NSString *)urlEncodeWithUTF8:(NSString *)sourceString
{
    NSString *encoderStr = [sourceString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return encoderStr;
}

//解码
+ (NSString *)urlDecodeWithUTF8:(NSString *)sourceString
{
    NSString *decoderStr = [sourceString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return decoderStr;
}

//利用正则表达式验证
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark - method 1
+ (NSMutableArray *)matchLinkWithStr:(NSString *)str withMatchStr:(NSString *)matchRegex;
{
    NSError *error = NULL;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:matchRegex
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:&error];
    NSArray *match = [reg matchesInString:str
                                  options:NSMatchingReportCompletion
                                    range:NSMakeRange(0, [str length])];
    
    NSMutableArray *rangeArr = [NSMutableArray array];
    // 取得所有的NSRange对象
    if(match.count != 0)
    {
        for (NSTextCheckingResult *matc in match)
        {
            NSRange range = [matc range];
            NSValue *value = [NSValue valueWithRange:range];
            [rangeArr addObject:value];
        }
    }
    // 将要匹配的值取出来,存入数组当中
    __block NSMutableArray *mulArr = [NSMutableArray array];
    [rangeArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSValue *value = (NSValue *)obj;
        NSRange range = [value rangeValue];
        
        NSString *subString = [str substringWithRange:range];
        
        if (![mulArr containsObject:subString]) {
            [mulArr addObject:subString];
        }
        
    }];
    return mulArr;
}

//移除掉所有Html的tag
+ (NSString *)filtHtmlTag:(NSString *)string
{
    if (!string) {
        return @"";
    }
    
    NSString* startTag = @"<";
    NSString* endTag = @">";
    
    NSString* regularExpressionString  = [[NSString alloc] initWithFormat:@"%@.*?%@", startTag, endTag];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpressionString
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:NULL];
    NSString* result = [regex stringByReplacingMatchesInString:string
                                                       options:0
                                                         range:NSMakeRange(0, string.length)
                                                  withTemplate:@"$2"];
    
    return result;
}

+ (NSString *)filterString:(NSString *)string
{
    if (string != nil) {
        if ([string isEqual: [NSNull null]]) {
            return @"";
        }
    }
    
    return string;
}

+ (NSString *)currentDateOfToday
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *nowFormatter = [[NSDateFormatter alloc]init];
    [nowFormatter setDateFormat:@"YYYY/MM/dd"];
    NSString *nowDateStr = [nowFormatter stringFromDate:nowDate];
    return nowDateStr;
}

+ (NSString *)getDateTimeString:(NSDate *)dateTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd日 HH:mm";
    NSString *str = [formatter stringFromDate:dateTime];
    return str;
}

+ (NSString*)getTimeTextFromInterval:(NSTimeInterval)interval
{
    long min = (long)interval / 60;    // divide two longs, truncates
    long sec = (long)interval % 60;    // remainder of long divide
    NSString* str = [NSString stringWithFormat:@"%02ld:%02ld", min, sec];
    return str;
}

+ (NSString *)filterFullWidthSpace:(NSString*)text
{
    NSMutableString *tempText = [text mutableCopy];
    [tempText replaceOccurrencesOfString:@"\u00a0"
                              withString:@" "
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [tempText length])];
    return [tempText copy];
}

+ (BOOL)isEmpty:(id)object
{
    if (!object) {
        return YES;
    }
    if ((NSNull *)object == [NSNull null]) {
        return YES;
    }
    if ([object isKindOfClass:[NSString class]]) {
        NSString *strObject = (NSString *)object;
        return [[strObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""];
    }
    return NO;
}

+ (NSString *)trimString:(NSString *)string
{
    NSString *trimedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\s" options:0 error:nil];
    NSString *finalTrimedString = [regex stringByReplacingMatchesInString:trimedString
                                                                  options:0
                                                                    range:NSMakeRange(0, [trimedString length])
                                                             withTemplate:@""];
    return finalTrimedString;
}

+ (NSString *)jsonStringFromObject:(id)object
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonStr;
}

+ (NSString *)dictToCommonString:(NSDictionary *)dict
{
    if (dict && dict.allKeys.count > 0) {
        NSMutableString *mString = [NSMutableString stringWithString:@"{"];
        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSString class]] && [obj isEqualToString:@""]) obj = @"\"\"";
            [mString appendFormat:@"%@=%@,",key,obj];
        }];
        NSMutableString *finalString = [NSMutableString stringWithString:[mString substringToIndex:mString.length-1]];
        [finalString appendString:@"}"];
        return finalString;
    }
    return @"";
}

+ (NSString *)md5Strings:(NSArray *)strArray
{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *str in strArray) {
        [string appendString:str];
    }
    NSString *mdtString = [SecutiryTools md5:string];
    return mdtString;
}

+ (NSString *)paramStringFromDict:(NSDictionary *)dict
{
    NSMutableString *paramsString = [NSMutableString stringWithString:@"?"];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [paramsString appendFormat:@"%@=%@&",key,obj];
    }];
    [paramsString deleteCharactersInRange:NSMakeRange(paramsString.length-1, 1)];
    return paramsString;
}



@end
