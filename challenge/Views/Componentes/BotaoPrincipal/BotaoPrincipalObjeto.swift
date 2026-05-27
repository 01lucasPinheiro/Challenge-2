//
//  BotaoPrincipalObjeto.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 26/05/26.
//

internal import CoreFoundation

class BotaoPrincipalObjeto{
    public static let ArrayBotoes = [
        
        //Tela Inicial
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Iniciar", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 300, heightFrame: 50, contornoBranco: false),
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Configurações", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 300, heightFrame: 50, contornoBranco: false),
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Sobre o Aplicativo", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 300, heightFrame: 50, contornoBranco: false),
        
        //Reiniciar
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Reiniciar Simulação", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoVermelho, corBotaoGradiente: .amareloGradiente, widthFrame: 300, heightFrame: 50, contornoBranco: false),
        
        //Cliques Mapa
        BotaoPrincipalClasse(mostrarIcon: true, mostrarTexto: false, icon: "icloud.fill", textoBotao: "Iniciar", radius: 50, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 100, heightFrame: 100, contornoBranco: true),
        BotaoPrincipalClasse(mostrarIcon: true, mostrarTexto: false, icon: "icloud.fill", textoBotao: "Iniciar", radius: 50, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 100, heightFrame: 100, contornoBranco: true),
        BotaoPrincipalClasse(mostrarIcon: true, mostrarTexto: false, icon: "icloud.fill", textoBotao: "Iniciar", radius: 50, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 100, heightFrame: 100, contornoBranco: true),
        
        //Ok
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Ok", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoVerde, corBotaoGradiente: .azulGradiente, widthFrame: 100, heightFrame: 58, contornoBranco: true),
        
        //Verificar Efeito
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Verificar Efeito", radius: 15, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 300, heightFrame: 50, contornoBranco: true),
        
        //Cancelar
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Cancelar", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoCinza, corBotaoGradiente: .azulGradiente, widthFrame: 212, heightFrame: 58, contornoBranco: false),
        //Reiniciar
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Reiniciar", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoVermelho, corBotaoGradiente: .amareloGradiente, widthFrame: 212, heightFrame: 58, contornoBranco: false),
        
        // + e -
        
        BotaoPrincipalClasse(mostrarIcon: false, mostrarTexto: true, icon: "minus", textoBotao: "—", radius: 20, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 75, heightFrame: 60, contornoBranco: true),
        BotaoPrincipalClasse(mostrarIcon: true, mostrarTexto: false, icon: "plus", textoBotao: "soma", radius: 20, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 75, heightFrame: 60, contornoBranco: true)
        
    ]
        
}
