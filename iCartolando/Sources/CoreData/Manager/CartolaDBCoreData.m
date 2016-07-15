//
//  CartolaDBCoreData.m
//  iCartolando
//
//  Created by PiciOS2016 on 7/14/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "CartolaDBCoreData.h"
#import "AppDelegate.h"
#import "CartolaDBCoreData.h"

@implementation CartolaDBCoreData

+ (UsuarioEntity *)novaInstancia {
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    UsuarioEntity *c = [NSEntityDescription insertNewObjectForEntityForName:@"UsuarioEntity" inManagedObjectContext:context];
    
    return c;
}

-(UsuarioEntity *)getUsuario {
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UsuarioEntity" inManagedObjectContext:context];
    
    NSFetchRequest *request = [NSFetchRequest new];
    request.entity = entity;
    
    NSError *error = nil;
    NSArray<UsuarioEntity*> *array = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Erro na consulta %@", error.description);
    }
    
    return array[0];
}


- (void)save:(UsuarioEntity *)cartolaEntity {
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error = nil;
    
    [context save:&error];
    if (error) {
        NSLog(@"Erro ao salvar contexto %@", error.description);
    }
    
}

- (void)delete:(UsuarioEntity *)cartolaEntity {
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error = nil;
    [context deleteObject:cartolaEntity];
    
    [context save:&error];
    if (error) {
        NSLog(@"Erro na consulta %@", error.description);
    }
}

@end
