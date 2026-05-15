//
//  testeEstados.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//
import SwiftUI
struct PlayButton: View {
//qunado usamos o binding avisamos a view pai que o valor da view filha foi modificada sendo assim podemos a alterar na tela
    @Binding var isPlaying: Bool //não tem valor pois vem do pai

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}

//view pai
struct PlayerView: View {
    @State private var isPlaying: Bool = false // Create the state here now.


    var body: some View {
        VStack {
            //a pergunta e porque nao so passar tudo como parametro ?
            //porque assim so poderiamos ler e nao modificar usando o binding podemos ler e alterar
            PlayButton(isPlaying: $isPlaying)
        }
    }
}


#Preview {
    PlayerView()
}
