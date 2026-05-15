//
//  Carro.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//
import Observation
// @Observable serve para avisar ao swift que sempre quando alguma propiedade mudar ela atualizar na view
@Observable
class Carro{
    var nome: String = "fox"
    var cor: String = "azul"
    
//    init(name: String, cor: String) {
//        self.nome = name
//        self.cor = cor
//    }
}
