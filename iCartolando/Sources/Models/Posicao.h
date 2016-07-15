//
//  Posicoes.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/13/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Posicao : NSObject

@property(nonatomic,assign) int posicaoId;
@property(nonatomic,strong) NSString *nome;
@property(nonatomic,strong) NSString *abreviacao;

@end
@protocol Posicao
@end