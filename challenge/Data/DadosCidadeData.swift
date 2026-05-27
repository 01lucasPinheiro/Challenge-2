//
//  DadosCidadeData.swift
//  teste
//
//  Created by Lucas on 25/05/26.
//
import Foundation
import Observation

@Observable
class DadosCidadeData {
    var temperatura: Double = 0.5 {
        didSet { print("Temperatura mudou para: \(temperatura)") }
    }
    var umidade: Double = 0.5 {
        didSet { print("Umidade mudou para: \(umidade)") }
    }
    var poluicao: Double = 0.5 {
        didSet { print("Poluição mudou para: \(poluicao)") }
    }
        
    func alterarTemperatura(novoValor: Double) {
        if temperatura <= 100 {
            self.temperatura += novoValor
        }
    }
    
    func alterarUmidade(novoValor: Double) {
        
        self.umidade = novoValor
    }
    
    func alterarPoulicao(novoValor: Double) {
            if poluicao <= 100 {
                self.poluicao += novoValor
            }
        }
        
    }

