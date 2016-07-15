//
//  UsuarioEntity+CoreDataProperties.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/14/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UsuarioEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface UsuarioEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *usuarioId;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *token;
@property (nullable, nonatomic, retain) NSString *mensagem;
@property (nullable, nonatomic, retain) NSString *senha;

@end

NS_ASSUME_NONNULL_END
