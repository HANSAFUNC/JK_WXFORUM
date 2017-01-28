//
//  stringutils.m
//  ipadyy
//
//  Created by lslin on 16-11-12.
//  Copyright (c) 2016年 Jackey. All rights reserved.
//

#import "StringUtils.h"

#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>


//http://stackoverflow.com/questions/392464/how-do-i-do-base64-encoding-on-iphone-sdk/800976#800976

static const char _base64EncodingTable[64] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static const short _base64DecodingTable[256] = {
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -2, -1, -1, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, 62, -2, -2, -2, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -2, -2, -2, -2, -2, -2,
    -2,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -2, -2, -2, -2, -2,
    -2, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2
};

@implementation StringUtils

+ (NSString *)encodeBase64WithString:(NSString *)strData
{
    return [StringUtils encodeBase64WithData:[strData dataUsingEncoding:NSUTF8StringEncoding]];
}

+ (NSString *)encodeBase64WithData:(NSData *)objData
{
    const unsigned char * objRawData = [objData bytes];
    char * objPointer;
    char * strResult;
    
    // Get the Raw Data length and ensure we actually have data
    int intLength = (int)[objData length];
    if (intLength == 0) return nil;
    
    // Setup the String-based Result placeholder and pointer within that placeholder
    strResult = (char *)calloc((((intLength + 2) / 3) * 4) + 1, sizeof(char));
    objPointer = strResult;
    
    // Iterate through everything
    while (intLength > 2) { // keep going until we have less than 24 bits
        *objPointer++ = _base64EncodingTable[objRawData[0] >> 2];
        *objPointer++ = _base64EncodingTable[((objRawData[0] & 0x03) << 4) + (objRawData[1] >> 4)];
        *objPointer++ = _base64EncodingTable[((objRawData[1] & 0x0f) << 2) + (objRawData[2] >> 6)];
        *objPointer++ = _base64EncodingTable[objRawData[2] & 0x3f];
        
        // we just handled 3 octets (24 bits) of data
        objRawData += 3;
        intLength -= 3;
    }
    
    // now deal with the tail end of things
    if (intLength != 0) {
        *objPointer++ = _base64EncodingTable[objRawData[0] >> 2];
        if (intLength > 1) {
            *objPointer++ = _base64EncodingTable[((objRawData[0] & 0x03) << 4) + (objRawData[1] >> 4)];
            *objPointer++ = _base64EncodingTable[(objRawData[1] & 0x0f) << 2];
            *objPointer++ = '=';
        } else {
            *objPointer++ = _base64EncodingTable[(objRawData[0] & 0x03) << 4];
            *objPointer++ = '=';
            *objPointer++ = '=';
        }
    }
    
    // Terminate the string-based result
    *objPointer = '\0';
    
    // Create result NSString object
    NSString *base64String = [NSString stringWithCString:strResult encoding:NSASCIIStringEncoding];
    
    // Free memory
    free(strResult);
    
    return base64String;
}

+ (NSData *)decodeBase64WithString:(NSString *)strBase64
{
    const char *objPointer = [strBase64 cStringUsingEncoding:NSASCIIStringEncoding];
    if (!objPointer) {
        assert(false);
        return nil;
    }
    size_t intLength = strlen(objPointer);
    int intCurrent;
    int i = 0, j = 0, k;
    
    unsigned char *objResult = calloc(intLength, sizeof(unsigned char));
    
    // Run through the whole string, converting as we go
    while ( ((intCurrent = *objPointer++) != '\0') && (intLength-- > 0) ) {
        if (intCurrent == '=') {
            if (*objPointer != '=' && ((i % 4) == 1)) {// || (intLength > 0)) {
                // the padding character is invalid at this point -- so this entire string is invalid
                free(objResult);
                return nil;
            }
            continue;
        }
        
        intCurrent = _base64DecodingTable[intCurrent];
        if (intCurrent == -1) {
            // we're at a whitespace -- simply skip over
            continue;
        } else if (intCurrent == -2) {
            // we're at an invalid character
            free(objResult);
            return nil;
        }
        
        switch (i % 4) {
            case 0:
                objResult[j] = intCurrent << 2;
                break;
                
            case 1:
                objResult[j++] |= intCurrent >> 4;
                objResult[j] = (intCurrent & 0x0f) << 4;
                break;
                
            case 2:
                objResult[j++] |= intCurrent >>2;
                objResult[j] = (intCurrent & 0x03) << 6;
                break;
                
            case 3:
                objResult[j++] |= intCurrent;
                break;
        }
        i++;
    }
    
    // mop things up if we ended on a boundary
    k = j;
    if (intCurrent == '=') {
        switch (i % 4) {
            case 1:
                // Invalid state
                free(objResult);
                return nil;
                
            case 2:
                k++;
                // flow through
            case 3:
                objResult[k] = 0;
        }
    }
    
    // Cleanup and setup the return NSData
    NSData * objData = [[NSData alloc] initWithBytes:objResult length:j];
    free(objResult);
    return objData;
}

+ (NSString*)decodeBase64WithStringToString:(NSString *)strBase64
{
    NSData* utf8 = [StringUtils decodeBase64WithString:strBase64];
    if (utf8) {
        return [[NSString alloc] initWithData:utf8 encoding:NSUTF8StringEncoding];
    }
    return nil;
}

//+ (NSString *)hmacsha1WithSecret:(NSString *)key data:(NSString *)data
//{
//    /*
//     http://stackoverflow.com/questions/15405460/why-my-python-and-objective-c-code-get-different-hmac-sha1-result
//     
//     运行结果应该与下面的Python代码一致。
//     http://hash.online-convert.com/sha1-generator
//     http://www.compileonline.com/execute_python_online.php
//     
//     //Code
//     #!/usr/local/bin/python2.7
//     
//     import base64
//     import hashlib
//     import hmac
//     
//     print base64.urlsafe_b64encode(hmac.new("85f3643ca7c495ba7c0a09edcb8e97add5718d52", "PUT\nyylivevideo\n\n1413798298\n", hashlib.sha1).digest())
//     
//     //Output:
//     h-QDk44Y7q2HwiHGO6JoFT0qrA8=
//     
//     */
//    
//    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
//    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
//    
//    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
//    
//    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
//    
//    NSData *hmac = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
//    
//    NSString *hash = [GTMBase64 stringByEncodingData:hmac];//[StringUtils encodeBase64WithData:hmac];
//    
//    //urlsafe_base64
//    hash = [hash stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
//    hash = [hash stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
//    
//    //NSLog(@"hmacsha1WithSecret: %@, content: %@, result: %@", key, data, hash);
//    return hash;
//}

+ (NSInteger)getWideStringLength:(NSString *)str
{
    float totalNum = 0;
    
    int len = (int)[str length];
    for (int i=0; i<len; ++i) {
        unichar c = [str characterAtIndex:i];
        totalNum += (c < 127) ? 0.5 : 1;
    }
    return totalNum + 0.5;
}

+ (NSInteger)getHalfStringLength:(NSString *)str
{
    NSInteger totalNum = 0;
    
    int len = (int)[str length];
    for (int i=0; i<len; ++i) {
        unichar c = [str characterAtIndex:i];
        totalNum += (c < 127) ? 1 : 2;
    }
    return totalNum;
}

+ (NSString *)subStringWithString:(NSString *)str wideStringLength:(NSUInteger)len
{
    if (len == 0) {
        return nil;
    }
    int strLen = (int)str.length;
    if (strLen <= len) {
        return [NSString stringWithString:str];
    }
    if ([StringUtils getHalfStringLength:str] <= len * 2) {
        return [NSString stringWithString:str];
    }
    float wideLen = 0;
    int index = 0;
    for (index = 0; index < strLen && (int)(wideLen + 0.5) < len; ++ index) {
        unichar c = [str characterAtIndex:index];
        wideLen += (c < 127) ? 0.5 : 1;
    }
    return [str substringToIndex:index];
}

+ (NSString *)timeStringByNow
{
    return [StringUtils timeStringByTimestamp:[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)timeStringByTimestamp:(double)timestamp
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
//    dateFormatter.dateStyle = kCFDateFormatterShortStyle;
//    dateFormatter.timeStyle = kCFDateFormatterShortStyle;
    return [dateFormatter stringFromDate: [NSDate dateWithTimeIntervalSince1970:timestamp]];
}

+ (NSString *)customTimeStringByTimestamp:(double)timestamp
{
    NSDate *oldDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [StringUtils customTimeStringByDate:oldDate];
}

#ifdef __IPHONE_8_0
+ (NSString *)customTimeStringByDate:(NSDate *)theDate
{
    //如果不是同一自然年，自然月，则不会显示“昨天”
    NSCalendar *clendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = kCFCalendarUnitMinute | kCFCalendarUnitHour | kCFCalendarUnitDay | kCFCalendarUnitMonth | kCFCalendarUnitYear;
    
    NSDateComponents *theDateComponents = [clendar components:unitFlags fromDate:theDate];
    NSDateComponents *nowComponents = [clendar components:unitFlags fromDate:[NSDate date]];

    NSString *format = nil;
    
    if ([theDateComponents year] != [nowComponents year]) {
        //不是今年
        format = @"yyyy-MM-dd";
    } else {
        //同一年
        if ([theDateComponents month] == [nowComponents month]) {   //同一月
            
            if ([theDateComponents day] == [nowComponents day]) {   //同一天

                if ([theDateComponents hour] == [nowComponents hour] && [theDateComponents minute] == [nowComponents minute]) { //同一分
                    return @"刚刚";
                } else {
                    format = @"HH:mm";
                }
            } else if ([theDateComponents day] == [nowComponents day] - 1) {
                format = @"昨天 HH:mm";
            } else {
                format = @"MM-dd HH:mm";
            }
        } else {
            format = @"MM-dd HH:mm";
        }
    }

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate: theDate];
}
#endif

+ (NSString *)timeLineStringByDate:(NSDate *)theDate
{
    NSTimeInterval interval = fabs([theDate timeIntervalSinceNow]);
    
    if (interval < 60) {                //一分钟内
        return @"刚刚";
    } else if (interval < (60 * 60)) {    //一小时内
        return [NSString stringWithFormat:@"%ld分钟前", ((long)interval)/60];
    } else if (interval < (60 * 60 * 24)) {   //一天内
        return [NSString stringWithFormat:@"%ld小时前", ((long)interval)/(60 * 60)];
    } else if (interval < (60 * 60 * 24 * 30)) { // 一个月内
        return [NSString stringWithFormat:@"%ld天前", ((long)interval)/(60 * 60 * 24)];
    } else if (interval < (60 * 60 * 24 * 30 * 12)) { // 一年内
        return [NSString stringWithFormat:@"%ld个月前", ((long)interval)/(60 * 60 * 24 * 30)];
    } else {
        return [NSString stringWithFormat:@"%ld年前",((long)interval)/(60 * 60 * 24 * 30 * 12)];
    } 
}

+ (NSString *)diffTimeStringByTimestamp:(double)timestamp
{
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDate *toDate = [NSDate date];
    NSCalendar *clendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = kCFCalendarUnitMinute | kCFCalendarUnitHour | kCFCalendarUnitDay | kCFCalendarUnitMonth | kCFCalendarUnitYear;
    NSDateComponents *cps = [clendar components:unitFlags fromDate:startDate toDate:toDate  options:0];

    NSInteger diff = [cps second];
    NSString *desc = @"秒前";
    
    if ([cps year] != NSNotFound && [cps year] != 0) {
        diff = [cps year];
        desc = @"年前";
    } else if ([cps month] != NSNotFound && [cps month] != 0){
        diff = [cps month];
        desc =@"个月前";
    } else if ([cps day] != NSNotFound && [cps day] != 0) {
        diff = [cps day];
        desc = @"日前";
    } else if ([cps hour] != NSNotFound && [cps hour] != 0){
        diff = [cps hour];
        desc = @"小时前";
    } else if ([cps minute] != NSNotFound && [cps minute] != 0) {
        diff = [cps minute];
        desc = @"分钟前";
    }
    
    return [NSString stringWithFormat:@"%ld%@", (long)diff, desc];
}

+ (NSString *)timeStringByDate:(NSDate *)date format:(NSString *)format
{
    static NSDateFormatter *dateFormatter = nil;
    
    @synchronized (self) {
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc] init];
        }
        [dateFormatter setDateFormat:format];
        return [dateFormatter stringFromDate:date];
    }
}

+ (NSString *)gmtTimeStringByDate:(NSDate *)date
{
    static NSDateFormatter *dateFormatter = nil;
    
    @synchronized (self) {
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss"];
            
            NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
            [dateFormatter setTimeZone:gmt];
        }

        return [dateFormatter stringFromDate:date];
    }
}

+ (NSDate *)dateByTimeString:(NSString *)time format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: format];  //@"yyyy-MM-dd HH:mm:ss"
    return [dateFormatter dateFromString:time];
}

+ (NSString *)shortFormatStringByNumber:(NSUInteger)num
{
    static int h = 100;
    static int k = 1000;
    static int w = 10000;

    if (num < k) {
        return [NSString stringWithFormat:@"%lu", (unsigned long)num];
    }
    if (k <= num && num < w) {
        return [NSString stringWithFormat:@"%lu.%luk", (unsigned long)(num / k), (unsigned long)((num % k) / h)];
    }
    
    static int kw = 10000000;
    
    if (w <= num && num < kw) {
        return [NSString stringWithFormat:@"%lu.%luw", (unsigned long)(num / w), (unsigned long)((num % w) / k)];
    }
    
    return [NSString stringWithFormat:@"%0.1fkw", num/(float)kw];
}

+ (NSString *)convertSpecialText:(NSString *)text
{
    if (![text length]) {
        return text;
    }
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"ิ̶ܾ҉ر"];
    text = [[text componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
    
    NSMutableString* resultStr = [[NSMutableString alloc] initWithCapacity:text.length];
    
    for (NSInteger i = 0; i < text.length; i++) {
        unichar c = [text characterAtIndex:i];
        
        if (c < 0x0600 || c > 0x0700) {
            [resultStr appendFormat:@"%C",c];
        } else {
//            DDLogInfo(@"convertSpecialText : %C",c);
        }
    }
    return resultStr;
}

+ (NSString *)minuteStringBySeconds:(NSInteger)sec
{
    return [NSString stringWithFormat:@"%.2ld:%.2ld", (long)(sec / 60), (long)(sec % 60)];
}

+ (NSString *)timeStringBySeconds:(NSInteger)sec
{
    long min = sec / 60;
    return [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", (long)(min / 60), (long)(min % 60), (long)(sec % 60)];
}

+ (NSString *)filterDefaultPortrait:(NSString *)url
{
    if ([url isEqualToString:@"要过滤的头像url"]) {
        return nil;
    }
    
    return url;
}

+ (NSString *)colorCodeForColor:(int)color
{
    const NSUInteger kColorCodeStringLength = 7;  //7 for #XXXXXX format
    NSString *colorCodeString = [NSString stringWithFormat:@"#%06X", color];
    if ([colorCodeString length] != kColorCodeStringLength) {
        
        return nil;
    }
    return colorCodeString;
}

+ (int)decimalNumberWithColorString:(NSString *)colorString
{
    NSString *colorStr = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    int decimalNumber =  (int)strtoul([colorStr UTF8String], 0, 16);
    return decimalNumber;
}

@end
