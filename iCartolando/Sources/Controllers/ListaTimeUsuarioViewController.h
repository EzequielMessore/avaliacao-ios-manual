//
//  ListaTimeUsuarioViewController.h
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface ListaTimeUsuarioViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong,getter=getUsuario) Usuario *usuario;
@end
