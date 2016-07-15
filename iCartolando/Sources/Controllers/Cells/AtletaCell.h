//
//  AtletaCell.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AtletaCell : UITableViewCell

- (void) setApelido:(NSString*)apelido;
- (void) setUrlImageAtleta:(NSString*)urlImageAtleta;
- (void) setPontos:(double)pontos;
- (void) setPreco:(double)preco;
- (void) setPosicao:(NSString*) posicao;
- (void) setClube:(NSString*) clube;
- (void) setMensagem:(NSString*) mensagem;

@end
