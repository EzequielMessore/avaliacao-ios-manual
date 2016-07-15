//
//  ListaParcialViewController.m
//  iCartolando
//
//  Created by PiciOS2016 on 7/13/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "ListaParcialViewController.h"
#import "Atleta.h"
#import "CartolaService.h"
#import "AtletaCell.h"

@interface ListaParcialViewController () {
    NSArray<Atleta *> *listaAtletas;
    CartolaService *service;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListaParcialViewController

static NSString* cellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    service = [CartolaService new];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AtletaCell class]) bundle:nil] forCellReuseIdentifier:cellIdentifier];
    [self buscaTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - chamadas ao CartolaService
- (void) buscaTime{
    [service recuperarAtletasRodadaAtual:^(NSString* error, NSMutableArray<Atleta *> *atletas) {
        listaAtletas = atletas;
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listaAtletas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AtletaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Atleta *atleta = listaAtletas[indexPath.row];
    [cell setApelido:atleta.apelido];
    [cell setMensagem:atleta.mensagem];
    [cell setUrlImageAtleta:atleta.urlFoto];
    [cell setPreco:atleta.preco];
    [cell setPontos:atleta.pontos];
    [cell setPosicao:atleta.posicao.nome];
    [cell setClube:atleta.clube.nome];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
