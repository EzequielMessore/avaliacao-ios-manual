//
//  CartolaService.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Atleta.h"
#import "Usuario.h"
#import "UsuarioEntity.h"

@interface CartolaService : NSObject
- (void) recuperarAtletasRodadaAtual:(void (^)(NSString *error, NSMutableArray<Atleta *> *))callback;
- (void) recuperarAtletas:(UsuarioEntity*) usuario callback:(void (^) (NSString * error, NSMutableArray<Atleta *>*atletas))callback;
- (void) fazerLogin:(Usuario*) usuario callback:(void (^) (NSString * error, Usuario* usuario))callback;
@end
