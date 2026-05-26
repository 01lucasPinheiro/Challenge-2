//
//  testeApp.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//

import SwiftUI

@main
struct testeApp: App {
    @State private var cidadeData = DadosCidadeData()
    var body: some Scene {
        WindowGroup {
            //JogoFabricaView()
            testeTela()
                .environment(cidadeData)
        }
    }
}
