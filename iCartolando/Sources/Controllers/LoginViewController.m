//
//  LoginViewController.m
//  iCartolando
//
//  Created by PiciOS2016 on 7/12/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+Utils.h"
#import "Usuario.h"
#import "CartolaService.h"
#import "ListaTimeUsuarioViewController.h"
#import "CartolaDBCoreData.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldLogin;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;

@end

@implementation LoginViewController

static NSString *CONST_IDENTIFIER = @"GoTabController";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFieldSenha.secureTextEntry = YES;
    CartolaDBCoreData *db = [CartolaDBCoreData new];
    UsuarioEntity *usuario = [db getUsuario];
    if(![usuario.token isEqualToString:@""]){
        [self performSegueWithIdentifier:CONST_IDENTIFIER sender:usuario];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if ([identifier isEqualToString:CONST_IDENTIFIER]) {
        //executa o serviço
        //retorna os valores no callback
        if(![self.textFieldLogin.text isEmpty] && ![self.textFieldSenha.text isEmpty]){
            Usuario *usuario = [[Usuario alloc]init];
            [usuario setEmail:self.textFieldLogin.text];
            [usuario setSenha:self.textFieldSenha.text];
            CartolaService *service = [CartolaService new];
            [service fazerLogin:usuario callback:^(NSString *error, Usuario *usuario) {
                if(!error){
                    [self performSegueWithIdentifier:CONST_IDENTIFIER sender:usuario];
                }
            }];
        }
    }
    return NO;
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITabBarController *tab = (UITabBarController*)segue.destinationViewController;
    for (UIViewController *childController in [tab childViewControllers]) {
        if ([childController isKindOfClass:[ListaTimeUsuarioViewController class]]) {
            ((ListaTimeUsuarioViewController *) childController).usuario = sender;
        }
    }
}


@end









