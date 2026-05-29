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
    
    @State var brilhoFundoTela: Double = 0 // nuvens de fundo e céu azul - brilho
    @State var valorStaturação: Double = 1
    
    @State var rostos: Int = 0
    
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
            ZStack {
                Image("fundoTelaInicial")
                    .resizable()
                    .interpolation(.none)
                    .brightness(brilhoFundoTela)
                    .saturation(valorStaturação)
                    .ignoresSafeArea()
                GeometryReader { geo in
                    let larguraNuvem: CGFloat = 900
                    let alturaNuvem: CGFloat = 400
                    let margem: CGFloat = 200
                    
                    Image("npd")
                        .resizable()
                        .brightness(brilhoFundoTela)
                        .saturation(valorStaturação)
                        .position(
                            x: geo.size.width - (larguraNuvem / 2) - margem,
                            y: geo.size.height - (alturaNuvem / 2) - margem
                        )
                    
                    Image("npc")
                        .resizable()
                        .brightness(brilhoFundoTela)
                        .saturation(valorStaturação)
                        .position(
                            x: (larguraNuvem / 2 ) + margem,
                            y: (alturaNuvem ) + margem
                        )
                    
                    
                    Image("npe")
                        .resizable()
                        .brightness(brilhoFundoTela)
                        .saturation(valorStaturação)
                        .position(
                            x: (larguraNuvem / 2) + margem,
                            y: geo.size.height - (alturaNuvem / 2) - margem
                        )
                }
                .allowsHitTesting(false) //impede o bloquieo de cliques
                
                
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    ScrollViewReader { proxy in
                        ZStack {
                            Image(mapa)
                                .frame(width: 2488, height: 1861)
                            
                            Image("predios")
                                .overlay(
                                    
                                    
                                    // EFEITOS ESPECIAIS
                                    ZStack{
                                        
                                        switch cidadeData.umidade {
                                            
                                        case 0:
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 140, y: -160)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            
                                            
                                            
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -110, y: -130)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -10, y: -200)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                                .onAppear {
                                                    rostos  = 0
                                                    cidadeData.poluicao = 0.25
                                                }
                                               
                                            
                                        case 0.25:
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 140, y: -160)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: 140, y: -160)
                                                .scaleEffect(1.3)
                                            
                                            
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -110, y: -130)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -110, y: -130)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -10, y: -200)
                                                .scaleEffect(1.3)
                                                .zIndex(1) // colocar a nuvem na frente das gotas
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -10, y: -200)
                                                .scaleEffect(1.3)
                                                .onAppear {
                                                    rostos  = 0
                                                    cidadeData.poluicao = 0.25
                                                }
                                        case 0.50:
                                            // Chuva 2 - moderada
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -50, y: 60)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -50, y: 60)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 140, y: -160)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: 140, y: -160)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -240, y: -130)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -240, y: -130)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -110, y: -130)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -110, y: -130)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -10, y: -200)
                                                .scaleEffect(1.3)
                                                .zIndex(1) // colocar a nuvem na frente das gotas
                                            EfeitoChuvaView(chuvaForte: false)
                                                .offset(x: -10, y: -200)
                                                .scaleEffect(1.3)
                                                .onAppear {
                                                    rostos  = 1
                                                    cidadeData.poluicao = 0.50
                                                }
                                        case 0.75:
                                            // chuva 3 - moderada forte
                                            
                                            Image("nuvemc1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -50, y: -10)
                                                .scaleEffect(3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -150, y: 0)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvemc1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -50, y: -140)
                                                .scaleEffect(3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: 30, y: -230)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -90, y: -230)
                                                .scaleEffect(1.3)  .scaleEffect(1.3)
                                            
                                            Image("nuvemc1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 50, y: -100)
                                                .scaleEffect(3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: 80, y: -170)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: 80, y: -170)
                                                .scaleEffect(1.3)  .scaleEffect(1.3)
                                            
                                            Image("nuvemc1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 0, y: -70)
                                                .scaleEffect(4)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -30, y: -130)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -40, y: -130)
                                                .scaleEffect(1.3)
                                                .onAppear {
                                                    rostos  = 2
                                                    cidadeData.poluicao = 0.75
                                                }
                                            
                                        case 1:
                                            Image("enchente")
                                                .interpolation(.none)
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 41, y: 0)
                                                .scaleEffect(0.77)
                                            
                                            
                                            Image("nuvemc1")
                                                .interpolation(.none)
                                                .opacity(1)
                                                .brightness(-0.4)
                                                .offset(x: -50, y: -10)
                                                .scaleEffect(3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -150, y: 0)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvemc1")
                                                .interpolation(.none)
                                                .opacity(1)
                                                .brightness(-0.4)
                                                .offset(x: -50, y: -140)
                                                .scaleEffect(3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: 30, y: -230)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -90, y: -230)
                                                .scaleEffect(1.3)  .scaleEffect(1.3)
                                            
                                            Image("nuvemc1")
                                                .interpolation(.none)
                                                .opacity(1)
                                                .brightness(-0.4)
                                                .offset(x: 50, y: -100)
                                                .scaleEffect(3)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: 80, y: -170)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: 80, y: -170)
                                                .scaleEffect(1.3)  .scaleEffect(1.3)
                                            
                                            RaioView()
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -50, y: -320)
                                                .scaleEffect(1)
                                                .zIndex(1)
                                            
                                            RaioView()
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -290, y: -140)
                                                .scaleEffect(1)
                                                .zIndex(1)
                                            RaioView()
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 90, y: -140)
                                                .scaleEffect(1)
                                                .zIndex(1)
                                            
                                            Image("nuvemc2")
                                                .interpolation(.none)
                                                .opacity(1)
                                                .brightness(-0.4)
                                                .offset(x: 0, y: -50)
                                                .scaleEffect(5)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -30, y: -130)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -40, y: -130)
                                                .scaleEffect(1.3)
                                            
                                            Image("nuvemc3")
                                                .interpolation(.none)
                                                .opacity(1)
                                                .brightness(-0.4)
                                                .offset(x: -50, y: -70)
                                                .scaleEffect(4)
                                                .zIndex(1)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -130, y: -130)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -150, y: -130)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -180, y: -130)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -280, y: -70)
                                                .scaleEffect(1.3)
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -160, y: -70)
                                                .scaleEffect(1.3)
                                            
                                            EfeitoChuvaView(chuvaForte: true)
                                                .offset(x: -230, y: -70)
                                                .scaleEffect(1.3)
                                                .onAppear {
                                                    rostos  = 2
                                                    cidadeData.poluicao = 1
                                                }
                                            
                                        default:
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -100, y: 0)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: 140, y: -160)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            
                                            
                                            
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -110, y: -130)
                                                .scaleEffect(1.3)
                                                .zIndex(1)
                                            
                                            
                                            Image("nuvem 1")
                                                .opacity(1)
                                                .brightness(-0.2)
                                                .offset(x: -10, y: -200)
                                                .scaleEffect(1.3)
                                                .onAppear {
                                                    rostos  = 0
                                                }
                                        }
                                    
                                        switch cidadeData.poluicao {
                                        case 0:
                                            ParticulasView(intensidadeFumaca: 0) // efeito na fábrica e modelos de 0 a 4
                                                .offset(x: 180, y: -540)
                                                .scaleEffect(0.7)
                                                .onAppear {
                                                    mudarBrilho(0)
                                                    mudarSaturação(0)
                                                    rostos = 1
                                                }
                                         
                                        case 0.25:
                                            ParticulasView(intensidadeFumaca: 2) // efeito na fábrica e modelos de 0 a 4
                                                .offset(x: 180, y: -540)
                                                .scaleEffect(0.7)
                                                .onAppear {
                                                    mudarBrilho(-0.1)
                                                    mudarSaturação(0.8)
                                                    rostos = 0
                                                }
                                            
                                        case 0.50:
                                            ParticulasView(intensidadeFumaca: 1) // efeito na fábrica e modelos de 0 a 4
                                                .offset(x: 180, y: -540)
                                                .scaleEffect(0.7)
                                                .onAppear{
                                                    mudarBrilho(-0.2)
                                                    mudarSaturação(0.6)
                                                    rostos = 1
                                                }
                                           
                                        case 0.75:
                                            ParticulasView(intensidadeFumaca: 3) // efeito na fábrica e modelos de 0 a 4
                                                .offset(x: 180, y: -540)
                                                .scaleEffect(0.7)
                                                .onAppear{
                                                    mudarBrilho(-0.3)
                                                    mudarSaturação(0.4)
                                                    rostos = 2
                                                }
                                        case 1:
                                            ParticulasView(intensidadeFumaca: 3) // efeito na fábrica e modelos de 0 a 4
                                                .offset(x: 180, y: -540)
                                                .scaleEffect(0.7)
                                               
                                          //  ParticulasView(intensidadeFumaca: 4) // efeito na fábrica e modelos de 0 a 4
                                              // .offset(x: 120, y: -540)
                                               // .scaleEffect(0.7)
                                            ParticulasView(intensidadeFumaca: 4) // efeito na fábrica e modelos de 0 a 4
                                                .offset(x: 120, y: -250)
                                                .scaleEffect(1.4)
                                                .onAppear {
                                                    mudarBrilho(-0.2)
                                                    mudarSaturação(0.3)
                                                    rostos = 2
                                                }
                                        default:
                                            ParticulasView(intensidadeFumaca: 2) // efeito na fábrica e modelos de 0 a 4
                                                .offset(x: 180, y: -540)
                                                .scaleEffect(0.7)
                                                .onAppear {
                                                    mudarBrilho(-0.1)
                                                    mudarSaturação(0.8)
                                                    rostos = 0
                                                }
                                        }
                                        
                                        
                                    }.scaleEffect(2.0)
                                )
                            
                            
                           // Image("predios")
                            
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
                        
                        
                        HStack{
                            Spacer()
                            VStack{
                                
                                RostosVariaveis(imagensRostosIndex: rostos)
                                Legenda(caixa: LegendaObjeto.arrayCaixas[2]){
                                    
                                }
                            }
                            
                            
                        }.padding(10)
                        HStack {
                            Legenda(caixa: LegendaObjeto.arrayCaixas[0]) {
                                VStack(alignment: .leading) {
                                    
                                    ConteudoLegenda(
                                        legenda: ConteudoLegendaObjeto.ArrayLegenda[0])
                                    ConteudoLegenda(
                                        legenda: ConteudoLegendaObjeto.ArrayLegenda[1])
                                    ConteudoLegenda(
                                        legenda: ConteudoLegendaObjeto.ArrayLegenda[2])
                                }
                            }
                            
                            Spacer()
                            
                            Legenda(caixa: LegendaObjeto.arrayCaixas[1]) {
                                VStack(alignment: .leading) {
                                    TermometroView(temperatura: cidadeData.poluicao, index: 0)
                                    TermometroView(temperatura: cidadeData.temperatura, index: 1)
                                    TermometroView(temperatura: cidadeData.umidade, index: 2)
                                }
                                
                            }
                            .padding(.top, 70)
                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            .padding()
                        
                        
                    }
                    
                }
            }
            
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
    
    func mudarBrilho(_ valor: Double) {
        brilhoFundoTela = valor
    }
    
    func mudarSaturação(_ valor: Double) {
        valorStaturação = valor
    }
}

#Preview {
    testeTela()
        .environment(DadosCidadeData())
}
