//
//  AtletaCell.m
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "AtletaCell.h"
#import "NSString+Utils.h"
#import "DownloadImageView.h"

@interface AtletaCell()

@property (weak, nonatomic) IBOutlet DownloadImageView *imageViewAtleta;
@property (weak, nonatomic) IBOutlet UILabel *lblApelido;
@property (weak, nonatomic) IBOutlet UILabel *lblPosicao;
@property (weak, nonatomic) IBOutlet UILabel *lblClube;
@property (weak, nonatomic) IBOutlet UILabel *lblPreco;
@property (weak, nonatomic) IBOutlet UILabel *lblPontos;
@property (weak, nonatomic) IBOutlet UILabel *lblTextPreco;
@property (weak, nonatomic) IBOutlet UILabel *lblTextPontos;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;

@end

@implementation AtletaCell

bool isMessage = false;

-(void)setMensagem:(NSString *)mensagem {
    if(![mensagem isEmpty]){
        self.lblMessage.text = mensagem;
        isMessage = true;
    }
}

- (void)setApelido:(NSString *)apelido {
    [self escondeCampo:self.lblApelido valor:apelido];
}

- (void)setPreco:(double)preco {
    if(preco >= 0){
        [self.lblTextPreco setHidden:true];
        [self.lblPreco setHidden:true];
    } else {
        self.lblPreco.text = [NSString doubleParaString:preco];
    }
}

- (void)setPontos:(double)pontos {
    if(!isMessage){
        if(pontos < 0){
            self.lblPontos.textColor = [UIColor redColor];
        } else {
            self.lblPontos.textColor = [UIColor blueColor];
        }
        self.lblPontos.text = [NSString doubleParaString:pontos];
    }else {
        [self.lblPontos setHidden:true];
        [self.lblTextPontos setHidden:true];
    }
}

- (void)setUrlImageAtleta:(NSString *)urlImageAtleta {
    if(urlImageAtleta != nil){
        [self.imageViewAtleta setUrl:urlImageAtleta];
    }else {
        [self.imageViewAtleta setHidden:true];
    }
}

- (void)setPosicao:(NSString *)posicao {
    [self escondeCampo:self.lblPosicao valor:posicao];
}

- (void)setClube:(NSString *)clube {
    [self escondeCampo:self.lblClube valor:clube];
}

- (void) escondeCampo:(UILabel*) campo valor:(NSString*)valor{
    if(valor == nil){
        [campo setHidden:true];
    }else {
        campo.text = valor;
    }
}

@end

