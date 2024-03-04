import pygame
import sys

# Inicializando o Pygame
pygame.init()

# Definindo as cores
VERDE = (0, 255, 0)
VERMELHO = (255, 0, 0)
BRANCO = (255, 255, 255)
AMARELO = (255, 255, 0)

# Definindo as dimensões da janela e o tamanho do quadrado do tabuleiro
LARGURA = 300
ALTURA = 300
TAM_QUADRADO = 100

# Definindo o tamanho da tela
tela = pygame.display.set_mode((LARGURA, ALTURA))
pygame.display.set_caption("Jogo da Velha")

# Definindo o tabuleiro
tabuleiro = [['', '', ''],
             ['', '', ''],
             ['', '', '']]

# Função para desenhar o tabuleiro
def desenhar_tabuleiro():
    for linha in range(1, 3):
        pygame.draw.line(tela, BRANCO, (0, linha * TAM_QUADRADO), (LARGURA, linha * TAM_QUADRADO), 2)
        pygame.draw.line(tela, BRANCO, (linha * TAM_QUADRADO, 0), (linha * TAM_QUADRADO, ALTURA), 2)

# Função para desenhar os X e O
def desenhar_simbolos():
    for linha in range(3):
        for coluna in range(3):
            if tabuleiro[linha][coluna] == 'X':
                pygame.draw.line(tela, VERDE, (coluna * TAM_QUADRADO + 15, linha * TAM_QUADRADO + 15),
                                 ((coluna + 1) * TAM_QUADRADO - 15, (linha + 1) * TAM_QUADRADO - 15), 5)
                pygame.draw.line(tela, VERDE, ((coluna + 1) * TAM_QUADRADO - 15, linha * TAM_QUADRADO + 15),
                                 (coluna * TAM_QUADRADO + 15, (linha + 1) * TAM_QUADRADO - 15), 5)
            elif tabuleiro[linha][coluna] == 'O':
                pygame.draw.circle(tela, VERMELHO, (coluna * TAM_QUADRADO + TAM_QUADRADO // 2,
                                                     linha * TAM_QUADRADO + TAM_QUADRADO // 2), TAM_QUADRADO // 2 - 15, 5)

# Função para verificar o vencedor
def verificar_vencedor():
    # Verificando linhas
    for linha in range(3):
        if tabuleiro[linha][0] == tabuleiro[linha][1] == tabuleiro[linha][2] != '':
            return tabuleiro[linha][0]
    
    # Verificando colunas
    for coluna in range(3):
        if tabuleiro[0][coluna] == tabuleiro[1][coluna] == tabuleiro[2][coluna] != '':
            return tabuleiro[0][coluna]
    
    # Verificando diagonais
    if tabuleiro[0][0] == tabuleiro[1][1] == tabuleiro[2][2] != '':
        return tabuleiro[0][0]
    if tabuleiro[0][2] == tabuleiro[1][1] == tabuleiro[2][0] != '':
        return tabuleiro[0][2]
    
    # Verificando empate
    if all(tabuleiro[i][j] != '' for i in range(3) for j in range(3)):
        return 'Empate'
    
    return None

# Função principal do jogo
def main():
    jogador = 'X'
    jogo_ativo = True
    
    while True:
        tela.fill(AMARELO)
        desenhar_tabuleiro()
        desenhar_simbolos()
        
        for evento in pygame.event.get():
            if evento.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            elif evento.type == pygame.MOUSEBUTTONDOWN and jogo_ativo:
                coluna = evento.pos[0] // TAM_QUADRADO
                linha = evento.pos[1] // TAM_QUADRADO
                if tabuleiro[linha][coluna] == '':
                    tabuleiro[linha][coluna] = jogador
                    if jogador == 'X':
                        jogador = 'O'
                    else:
                        jogador = 'X'
        
        vencedor = verificar_vencedor()
        if vencedor is not None:
            jogo_ativo = False
            if vencedor == 'Empate':
                texto = "Empate!"
            else:
                texto = f"O jogador {vencedor} venceu!"
            fonte = pygame.font.Font(None, 36)
            texto_renderizado = fonte.render(texto, True, VERMELHO)
            tela.blit(texto_renderizado, (LARGURA // 2 - texto_renderizado.get_width() // 2, ALTURA // 2 - texto_renderizado.get_height() // 2))
        
        pygame.display.flip()

if __name__ == "__main__":
    main()
