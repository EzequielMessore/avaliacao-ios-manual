//
//  JsonParser.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Atleta.h"
#import "Usuario.h"
#import "Posicao.h"

@interface JsonParser : NSObject
-(void)parseData:(NSData *)data callback:(void (^)(NSMutableArray<Atleta *> *listaCallback))callback;
-(void) parseLogin:(NSData*)data callback:(void (^)(Usuario *usuario))callback;
- (void)parseAtletasPontuados:(NSData *)data callback:(void (^)(NSMutableArray<Atleta *> *listaCallback))callback;
@end
