//
//  CartolaService.m
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "CartolaService.h"
#import "JsonParser.h"
#import "CartolaDBCoreData.h"

@implementation CartolaService


- (void) recuperarAtletasRodadaAtual:(void (^)(NSString *error, NSMutableArray<Atleta *> *))callback {
    JsonParser *jsonParser = [JsonParser new];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://api.cartolafc.globo.com/atletas/pontuados"];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            [jsonParser parseAtletasPontuados:data callback:^(NSMutableArray<Atleta *> *listaCallback) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(error.description,listaCallback);
                });
            }];
        } else {
            callback(error.description,nil);
        }
        
    }];
    [task resume];
}

- (void)recuperarAtletas:(UsuarioEntity *)usuario callback:(void (^)(NSString *, NSMutableArray<Atleta *> *))callback {
    JsonParser *jsonParser = [JsonParser new];
    NSURL *url = [NSURL URLWithString:@"https://api.cartolafc.globo.com/auth/time"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSString *token = [NSString stringWithFormat:@"%@", usuario.token];
    [request addValue:token forHTTPHeaderField:@"X-GLB-Token"];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            [jsonParser parseData:data callback:^(NSMutableArray<Atleta *> *listaCallback) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(error.description,listaCallback);
                });
            }];
        }else{
            callback(error.description,nil);
        }
    }];
    [task resume];

}

- (void)fazerLogin:(Usuario *)usuario callback:(void (^)(NSString *, Usuario *))callback {
    JsonParser *jsonParser = [JsonParser new];
    CartolaDBCoreData *db = [CartolaDBCoreData new];
    NSURL *url = [NSURL URLWithString:@"https://login.globo.com/api/authentication"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    
    NSString *header = [NSString stringWithFormat:@"{\"payload\":{\"email\":\"%@\",\"password\":\"%@\",\"serviceId\": 438}}",[usuario getEmail],[usuario getSenha]];
    NSData *jsonData = [header dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:jsonData];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%ld", (long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];

    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [jsonParser parseLogin:data callback:^(Usuario *usuario) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UsuarioEntity *cEntity = [CartolaDBCoreData novaInstancia];
                [cEntity setUsuarioId:usuario.usuarioId];
                [cEntity setMensagem:usuario.mensagem];
                [cEntity setToken:usuario.token];
                [cEntity setEmail:usuario.email];
                [cEntity setSenha:usuario.senha];

                [db save:cEntity];
                callback(error.description,usuario);
            });
        }];
    }];
    
    [task resume];
}

@end




























