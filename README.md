# Trabalho-da-facul
Meu trabalho da facul
# Função para verificar se uma string é um palíndromo
def eh_palindromo(texto):
    texto = texto.lower()  # Converte a string para minúsculas
    texto = texto.replace(" ", "")  # Remove espaços em branco da string
    invertido = texto[::-1]  # Inverte a string
    
    # Verifica se a string original é igual à string invertida
    if texto == invertido:
        return True
    else:
        return False

# Programa principal
valor = input("Digite um valor: ")

if eh_palindromo(valor):
    print("O valor digitado é um palíndromo!")
else:
    print("O valor digitado não é um palíndromo.")
