//
//  JogoLixeiraViewModel.swift
//  teste
//
//  Created by Lucas on 21/05/26.
//

import SwiftUI
import Observation

struct Residuo {
    let idLixeiraCorreta: Int
    let nomeImagem: String
}

@Observable
class JogoLixeiraViewModel {
    var posicao: [CGSize] = Array(repeating: .zero, count: 5)
    var lixeirasAbertas: [Bool] = Array(repeating: false, count: 5)
    var lixeiraCerta: [Int] = [0, 1, 2, 3, 4].shuffled() // aleatorizar a posicao
    var pontuacao = 0
    var framesLixeiras: [CGRect] = Array(repeating: .zero, count: 5)
    var circulosVisiveis: [Bool] = Array(repeating: true, count: 5)
    var lixeirasResolvidas: [Bool] = Array(repeating: false, count: 5)
    let nomesLixeiras = ["Metal", "Vidro", "Papel", "Plastico", "Organica"]
    
    var residuosParaJogar: [Residuo] = [
        Residuo(idLixeiraCorreta: 0, nomeImagem: "metal"),
        Residuo(idLixeiraCorreta: 1, nomeImagem: "vidro"),
        Residuo(idLixeiraCorreta: 2, nomeImagem: "papel"),
        Residuo(idLixeiraCorreta: 3, nomeImagem: "plastico"),
        Residuo(idLixeiraCorreta: 4, nomeImagem: "organico")
    ].shuffled()
    
    func nomeImagemLixeira(para index: Int) -> String {
        if lixeirasResolvidas[index] {
            return "lixeira\(nomesLixeiras[index])Fixa"
        }
        
        return lixeirasAbertas[index] ? "lixeiraAberta" : "lixeiraFechada"
    }
    
    func atualizarArrasto(index: Int, translacao: CGSize, localizacao: CGPoint) {
        guard circulosVisiveis[index] else { return }
        
        posicao[index] = translacao
        guard circulosVisiveis[index] else { return }
        
        posicao[index] = translacao
        for i in 0..<5 {
            if !lixeirasResolvidas[i] {
                lixeirasAbertas[i] = framesLixeiras[i].contains(localizacao)
            }
        }
    }
    func finalizarArrasto(index: Int, localizacao: CGPoint, cidadeData: DadosCidadeData) {
        var caiuEmAlgumaLixeira = false
        
        for indexDaLixeira in 0..<5 {
            if framesLixeiras[indexDaLixeira].contains(localizacao) && !lixeirasResolvidas[indexDaLixeira] {
                caiuEmAlgumaLixeira = true
                
                let lixeiraCorreta = residuosParaJogar[index].idLixeiraCorreta
                
                if indexDaLixeira == lixeiraCorreta {
                    pontuacao += 5
                    cidadeData.alterarPoulicao(novoValor: 0.05)
                    lixeirasResolvidas[indexDaLixeira] = true
                } else {
                    pontuacao -= 5
                    cidadeData.alterarPoulicao(novoValor: -0.05)
                }
                
                circulosVisiveis[index] = false
                break
            }
        }
        
        if !caiuEmAlgumaLixeira {
            posicao[index] = .zero
        }
        
        for i in 0..<5 {
            lixeirasAbertas[i] = false
        }
    }
}
