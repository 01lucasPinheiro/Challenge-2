//
//  Carro.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//
import Observation
import Foundation

struct Carro{
    var nome : String
    var cor : String
}
// @Observable serve para avisar ao swift que sempre quando alguma propiedade mudar ela atualizar na view
@Observable
class CarroViewModel{
    var carro: Carro
    
    var descricaoCarro: String {
        return "O carro é um \(carro.nome) de cor \(carro.cor)"
    }
    
    init(carro: Carro){
        self.carro = carro
    }
    
    func pintarCarroll(novaCor: String){
        carro.cor = novaCor
    }
    
//    init(name: String, cor: String) {
//        self.nome = name
//        self.cor = cor
//    }
}
