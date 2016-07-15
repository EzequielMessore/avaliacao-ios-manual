//
//  Usuario.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

@property(nonatomic,strong) NSString* usuarioId;
@property(nonatomic,strong) NSString* mensagem;
@property(nonatomic,strong) NSString* token;
@property(nonatomic,strong,getter=getEmail) NSString* email;
@property(nonatomic,strong,getter=getSenha) NSString* senha;

@end

@protocol Usuario
@end