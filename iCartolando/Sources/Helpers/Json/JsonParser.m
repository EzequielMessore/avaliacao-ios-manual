//
//  JsonParser.m
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "JsonParser.h"

@implementation JsonParser
static NSString *CONST_ATLETAS = @"atletas";
static NSString *CONST_APELIDO = @"apelido";
static NSString *CONST_URL_FOTO	 = @"foto";
static NSString *CONST_PONTOS = @"pontos_num";
static NSString *CONST_PONTUACAO = @"pontuacao";
static NSString *CONST_PRECO = @"preco_num";
static NSString *CONST_ID_POSICAO = @"posicao_id";
static NSString *CONST_ID = @"id";
static NSString *CONST_MENSAGEM = @"userMessage";
static NSString *CONST_TOKEN = @"glbId";
static NSString *CONST_ID_CLUBE = @"clube_id";
static NSString *CONST_ATLETA_MENSAGEM = @"mensagem";

#pragma mark constantes das posições
static NSString *CONST_POSICOES = @"posicoes";
static NSString *CONST_POSICAO_ID = @"id";
static NSString *CONST_POSICAO_NOME = @"nome";
static NSString *CONST_POSICAO_ABREV = @"abreviacao";

#pragma mark constantes do clube
static NSString *CONST_CLUBES = @"clubes";
static NSString *CONST_CLUBES_ID = @"id";
static NSString *CONST_CLUBES_NOME = @"nome";
static NSString *CONST_CLUBES_ABREV = @"abreviacao";
static NSString *CONST_CLUBES_POSICAO = @"posicao";

- (void)parseData:(NSData *)data callback:(void (^)(NSMutableArray<Atleta *> *listaCallback))callback {

    NSMutableArray *listaAtletas = [@[] mutableCopy];
    if (data.length > 0) {
        
        NSError *error = nil;
        NSDictionary *dicJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        if (error) {
            NSLog(@"Erro ao abrir arquivo");
        }else{
            NSDictionary *dicAtletas = dicJson[CONST_ATLETAS];            
            for (NSDictionary *dicAtleta in dicAtletas) {
                Atleta * atleta = [Atleta new];
                [atleta setApelido:dicAtleta[CONST_APELIDO]];
                [atleta setUrlFoto:dicAtleta[CONST_URL_FOTO]];
                [atleta setPontos:[dicAtleta[CONST_PONTOS] doubleValue]];
                [atleta setPreco:[dicAtleta[CONST_PRECO] doubleValue]];
                [atleta setIdPosicao:[dicAtleta[CONST_ID_POSICAO] doubleValue]];
                [atleta setIdClube:[dicAtleta[CONST_ID_CLUBE] doubleValue]];
                
                //Pega a posição
                NSDictionary *dicPosicoes = dicJson[CONST_POSICOES];
                NSDictionary *dict = [dicPosicoes objectForKey:[@(atleta.idPosicao) stringValue]];
                Posicao *pos = [Posicao new];
                [pos setPosicaoId:[dict[CONST_POSICAO_ID] doubleValue]];
                [pos setNome:dict[CONST_POSICAO_NOME]];
                [pos setAbreviacao:dict[CONST_POSICAO_ABREV]];
                [atleta setPosicao:pos];
                
                //Pega o Clube
                NSDictionary *dicClubes = dicJson[CONST_CLUBES];
                NSDictionary *dicClube = [dicClubes objectForKey:[@(atleta.idClube) stringValue]];
                Clube *clube = [Clube new];
                [clube setClubeId:[dicClube[CONST_CLUBES_ID] doubleValue]];
                [clube setNome:dicClube[CONST_CLUBES_NOME]];
                [clube setAbrev:dicClube[CONST_CLUBES_ABREV]];
                [clube setPosicao:[dicClube[CONST_CLUBES_POSICAO] doubleValue]];
                [atleta setClube:clube];
                
                [listaAtletas addObject:atleta];
            }
            

            callback(listaAtletas);
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
}

- (void)parseAtletasPontuados:(NSData *)data callback:(void (^)(NSMutableArray<Atleta *> *listaCallback))callback {
    NSMutableArray *listaAtletas = [@[] mutableCopy];
    if (data.length > 0) {
        
        NSError *error = nil;
        NSDictionary *dicJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        if (error) {
            NSLog(@"Erro ao abrir arquivo");
        }else{
            NSDictionary *dicAtletas = dicJson[CONST_ATLETAS];
            Atleta * atleta = [Atleta new];
            if(dicAtletas == nil){
                [atleta setMensagem:dicJson[CONST_ATLETA_MENSAGEM]];
                [listaAtletas addObject:atleta];
            }

            for (NSString *key in dicAtletas.allKeys) {
                
                NSDictionary *dicAtleta = dicAtletas[key];
                
                [atleta setApelido:dicAtleta[CONST_APELIDO]];
                [atleta setUrlFoto:dicAtleta[CONST_URL_FOTO]];
                [atleta setPontos:[dicAtleta[CONST_PONTUACAO] doubleValue]];
                [atleta setIdPosicao:[dicAtleta[CONST_ID_POSICAO] doubleValue]];
                [atleta setIdClube:[dicAtleta[CONST_ID_CLUBE] doubleValue]];
                
                //Pega a posição
                NSDictionary *dicPosicoes = dicJson[CONST_POSICOES];
                NSDictionary *dict = [dicPosicoes objectForKey:[@(atleta.idPosicao) stringValue]];
                Posicao *pos = [Posicao new];
                [pos setPosicaoId:[dict[CONST_POSICAO_ID] doubleValue]];
                [pos setNome:dict[CONST_POSICAO_NOME]];
                [pos setAbreviacao:dict[CONST_POSICAO_ABREV]];
                [atleta setPosicao:pos];
                
                //Pega o Clube
                NSDictionary *dicClubes = dicJson[CONST_CLUBES];
                NSDictionary *dicClube = [dicClubes objectForKey:[@(atleta.idClube) stringValue]];
                Clube *clube = [Clube new];
                [clube setClubeId:[dicClube[CONST_CLUBES_ID] doubleValue]];
                [clube setNome:dicClube[CONST_CLUBES_NOME]];
                [clube setAbrev:dicClube[CONST_CLUBES_ABREV]];
                [clube setPosicao:[dicClube[CONST_CLUBES_POSICAO] doubleValue]];
                [atleta setClube:clube];
                
                [listaAtletas addObject:atleta];
            }
            callback(listaAtletas);
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }

}

- (void)parseLogin:(NSData *)data callback:(void (^)(Usuario *usuario))callback {
    if (data.length > 0) {
        Usuario *usuario = [Usuario new];
        NSError *error = nil;
        NSDictionary *dicJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        if (error) {
            NSLog(@"Erro ao abrir arquivo");
        }else{
            [usuario setUsuarioId:dicJson[CONST_ID]];
            [usuario setMensagem:dicJson[CONST_MENSAGEM]];
            [usuario setToken:dicJson[CONST_TOKEN]];
        }
        callback(usuario);
    }
}

@end





















