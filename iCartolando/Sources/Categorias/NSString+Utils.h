//
//  NSString+Utils.h
//  PICAplicativoCarro
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

//Remove os espaços e os caracteres \n do final da string
- (NSString*)trimAndNewLine;
//Concatena as string
- (NSString*)concat:(NSString*)string;
//Subistitui as ocorrências de uma string por outra string
- (NSString*)substituir:(NSString*)string por:(NSString*)outraString;

+ (NSString*) doubleParaString:(double) valor;

- (NSString*)trim;
- (BOOL) isEmpty;
@end