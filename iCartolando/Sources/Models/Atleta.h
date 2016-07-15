//
//  Atleta.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/8/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Posicao.h"
#import "Clube.h"

@interface Atleta : NSObject

@property(nonatomic,strong) NSString *apelido;
@property(nonatomic,strong) NSString *urlFoto;
@property(nonatomic,assign) double preco;
@property(nonatomic,assign) double pontos;
@property(nonatomic,assign) int idPosicao;
@property(nonatomic,assign) int idClube;
@property(nonatomic,strong) Posicao *posicao;
@property(nonatomic,strong) Clube *clube;
@property(nonatomic,strong) NSString *mensagem;

@end

@protocol Atleta
@end