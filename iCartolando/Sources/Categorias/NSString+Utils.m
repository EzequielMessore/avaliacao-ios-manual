//
//  NSString+Utils.m
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 6/27/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

//Remove os espaços e os caracteres \n do final da string
- (NSString *)trimAndNewLine{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
//Concatena as string
- (NSString *)concat:(NSString *)string{
    return [self stringByAppendingString:string];
}
//Subistitui as ocorrências de uma string por outra string
- (NSString*) substituir:(NSString *)string por:(NSString *)outraString{
    return [self stringByReplacingOccurrencesOfString:string withString:outraString];
}

+ (NSString *)doubleParaString:(double)valor {
    NSNumber *doubleValue = [NSNumber numberWithDouble:valor];
    return [doubleValue stringValue];
}

- (NSString*)trim{
    //Retorna uma string sem espaços no início e fim
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL) isEmpty{
    BOOL isEmpty = NO;
    if ([self trim].length == 0) {
        isEmpty = YES;
    }
    return isEmpty;
}

@end
