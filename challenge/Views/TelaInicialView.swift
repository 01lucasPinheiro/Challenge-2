import SwiftUI

enum TipoJogo: Hashable, Identifiable {
    case lixeira
    case fabrica
    case chuva
    
    var id: Self { self }
}

struct testeTela: View {
    @Environment(DadosCidadeData.self) var cidadeData
    
    @State var corCirculo: Color = .red
    @State private var barra1 = 150.0
    @State private var barra2 = 100.0
    @State private var jogoSelecionado: TipoJogo? = nil
    @State private var navegando: Bool = false
    @State private var estadoMapa = 0
    @State private var escalaAtual: CGFloat = 0.5
    @State private var ultimaEscala: CGFloat = 1.0
    
    let zoomMinimo: CGFloat = 0.5
    let zoomMaximo: CGFloat = 2.0
    var mapa: String {
        switch estadoMapa {
        case 0...2:
            return "mapa"
        default:
            return "mapa2"
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    ScrollViewReader { proxy in
                        ZStack {
                            Image(mapa)
                                .frame(width: 2488, height: 1861)
                            
                            
                            Image("logoChuva")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .position(x: 800, y: 300)
                                .onTapGesture {
                                    jogoSelecionado = .chuva
                                }
                            
                            Image("logoFabrica")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .position(x: 1400, y: 400)
                                .onTapGesture {
                                    jogoSelecionado = .fabrica
                                }
                            Image("logoLixeiras")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .position(x: 1260, y: 1420)
                                .onTapGesture {
                                    jogoSelecionado = .lixeira
                                }
                        }
                        .scaleEffect(escalaAtual)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    let novaEscala = ultimaEscala * value
                                    //clamp que restringe o valor entre o mim e max
                                    escalaAtual = min(max(novaEscala, zoomMinimo), zoomMaximo)
                                }
                                .onEnded { _ in
                                    ultimaEscala = escalaAtual
                                }
                        )
                        .id("centroMapa")
                        .onAppear {
                            proxy.scrollTo("centroMapa", anchor: .center)
                        }
                    }
                }
                
                
                ZStack{
                    VStack{
                        TermometroView(temperatura: cidadeData.poluicao, index: 0)
                        TermometroView(temperatura: cidadeData.temperatura, index: 1)
                        TermometroView(temperatura: cidadeData.umidade, index: 2)
                    }
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                
            }.background(Image("fundoTelaInicial"))
                .navigationDestination(item: $jogoSelecionado) { jogo in
                    switch jogo {
                    case .chuva:
                        JogoChuvaView()
                    case .lixeira:
                        JogoLixeiraView()
                    case .fabrica:
                        JogoFabricaView()
                    }
                }
        }
    }
}

#Preview {
    testeTela()
        .environment(DadosCidadeData())
}
