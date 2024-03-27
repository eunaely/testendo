# Definição da classe Produto para armazenar as informações dos produtos
class Produto:
    def __init__(self, nome, descricao, valor, disponivel):
        self.nome = nome
        self.descricao = descricao
        self.valor = valor
        self.disponivel = disponivel

# Lista para armazenar os produtos cadastrados
produtos_cadastrados = []

# Função para cadastrar um novo produto
def cadastrar_produto():
    nome = input("Nome do produto: ")
    descricao = input("Descrição do produto: ")
    valor = float(input("Valor do produto: "))
    disponivel = input("Disponível para venda (sim/não): ")
    produto = Produto(nome, descricao, valor, disponivel.lower() == 'sim')
    produtos_cadastrados.append(produto)
    listar_produtos()

# Função para listar os produtos
def listar_produtos():
    produtos_ordenados = sorted(produtos_cadastrados, key=lambda p: p.valor)
    print("\nListagem de Produtos:")
    print("{:<20} {:<10}".format("Nome", "Valor"))
    for produto in produtos_ordenados:
        print("{:<20} {:<10.2f}".format(produto.nome, produto.valor))

# Função principal que permite o cadastro e listagem de produtos
def main():
    while True:
        print("\nMenu:")
        print("1. Cadastrar novo produto")
        print("2. Listar produtos")
        print("3. Sair")
        opcao = input("Escolha uma opção: ")
        if opcao == '1':
            cadastrar_produto()
        elif opcao == '2':
            listar_produtos()
        elif opcao == '3':
            break
        else:
            print("Opção inválida!")

# Executar o programa
if __name__ == "__main__":
    main()
