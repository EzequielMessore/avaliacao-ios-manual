//
//  Clube.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/13/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Clube : NSObject

@property(nonatomic,assign) int clubeId;
@property(nonatomic,strong) NSString* nome;
@property(nonatomic,strong) NSString* abrev;
@property(nonatomic,assign) int posicao;
@end

@protocol Clube
@end