from class_Conta import Conta


class Banco:

    def __init__(self, nome:str):

        self.nome = nome

        self.lista_clientes = list()

    
    def cadastrar_cliente(self, nome: str, cpf: str, senha: str, renda:float, chave_pix: str, saldo: float) -> bool:
        '''Criar um objeto conta dado nome, cpf, senha e renda'''
        # Primeiro: instanciar um objeto da classe cliente
        novo_cliente = Conta(nome, cpf, senha, renda, chave_pix, saldo)
        # Segundo: adiciono objeto cliente recem criado à lista lista_clientes
        self.lista_clientes.append(novo_cliente)
        # Terceiro: retornar confirmação
        return True

    def acessar_conta(self, cpf:str, senha:str) -> Conta :
        '''Dado um cpf e senha, procurar a conta na lista de clientes e retornar a conta'''
        # Primeiro: percorrer lista de clientes do banco
        for objeto in self.lista_clientes:
            # Segundo: comparar parametros
            if( objeto.cpf == cpf and 
                objeto.senha == senha ):
                # Terceiro: retorna caso encontrar
                return objeto
            # Segundo: caso contrário
            else:
                # Terceiro: retorna nada
                return None
            

    def analisar_credito(self, cpf:str):
        '''Dada renda de uma conta, definir regras que retornem um limite adequado para o cliente'''
        # Primeiro: percorrer lista de clientes do banco
        for i in self.lista_clientes:
            # Segundo: comparar parametros
            if i.get_cpf() == cpf:
                if i.renda >= 2000:
                    #Multiplicar a renda por um valor para chegar ao limite de credito estabecido
                    limite_cartao = i.renda * 0.3
                    #Ira retornar o valor do limite do cartao de acordo com a funcao
                    return limite_cartao
                #Caso a renda seja menor, ira fazer um calculo diferente, dando um limite mais baixo ao cliente
                else: 
                    limite_cartao = i.renda * 0.1
                    return limite_cartao
        return None
