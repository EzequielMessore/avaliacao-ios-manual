//
//  CartolaDBCoreData.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/14/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UsuarioEntity.h"

@interface CartolaDBCoreData : NSObject
+ (UsuarioEntity*)novaInstancia;
- (void) save:(UsuarioEntity*)cartolaEntity;
- (void) delete:(UsuarioEntity*)cartolaEntity;
- (UsuarioEntity*)getUsuario;
@end
