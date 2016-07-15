//
//  Liga.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/8/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Liga : NSObject

@property(nonatomic,strong) NSString *nome;
@property(nonatomic,strong) NSString *descricao;
@property(nonatomic,assign) int totalTimesNaLiga;


@end

@protocol Liga
@end