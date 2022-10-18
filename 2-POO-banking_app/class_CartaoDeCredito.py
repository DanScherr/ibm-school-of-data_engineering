class CartaoDeCredito:

    def __init__(self, nome_cartao: str, limite_total: float):

        self.nome_cartao     = nome_cartao

        self.__limite_cartao = limite_total
        self.limite_atual    = limite_total

        self.valor_fatura    = 0.0


    def comprar(self, valor_compra: float) -> bool:
        '''Checar limite, se é possivel realizar a compra, reduzir limite, etc'''
        
        ''' Recebemos o valor da compra do cliente e checamos se é possível executá-la
            -> Se o valor da compra for menor que o limite atual, retonamos False
            -> Se o valor da compra for menor ou igual ao valor do limite a compra é efetuada '''
        if (valor_compra <= self.limite_atual):

            # Então atualizamos o valor do limite atual, subtraindo o valor da compra
            self.limite_atual = self.get_limite() - valor_compra
            
            # E logo somamos ao valor da fatura o valor da compra
            self.valor_fatura = self.get_valor_fatura() + valor_compra

            return True

        else:
            return False


    def get_valor_fatura(self):
        ''' Retonamos o valor da fatura '''
        return self.valor_fatura

    def set_fatura(self, valor_fatura):
        ''' Poderemos alterar o valor da fatura '''
        self.fatura = valor_fatura


    def get_limite(self):
        ''' Retornamos o valor do limite do cartão '''
        return self.limite_atual

    def set_limite(self, limite_atual):
        ''' Poderemos alterar o valor do limite '''
        self.limite = limite_atual


    def pagar_fatura(self, valor_pagar_fatura:float) -> bool :      
        '''Pagar fatura, reistituir limite'''

        ''' Aqui podemos conferir o valor a ser pago: será o valor total ou parte?'''
        if (valor_pagar_fatura >= self.get_valor_fatura()):

            # Se for o valor total ou mais, logo restituímos o valor do limite do cliente
            self.limite_atual = self.__limite_cartao

            # E se o pagamento for acima do valor da fatura, geraremos um troco
            troco = round(valor_pagar_fatura - self.valor_fatura, 2)
            print(f"Seu troco é de R${troco}.")

            # E zeraremos o valor total da fatura
            self.set_fatura(0)

            return True

        else:

            ''' Caso o cliente vá pagar um valor menor que o valor total da fatura, 
            subtrairemos o valor a ser pago e ajustamos o limite'''
            self.valor_fatura = self.get_valor_fatura() - valor_pagar_fatura
            self.limite_atual = self.get_limite() - self.get_valor_fatura()
            
            # Também avisaremos o cliente que a fatura total não foi paga
            print("Lamentamos que não seja dinheiro o suficiente.")

            # Retornaremos o valor faltante
            print(f"Ainda faltam R${self.get_valor_fatura()} a serem pagos da fatura.")

            # E retornaremos o ajuste no limite atual 
            print(f"Seu limite atual fica de R${self.get_limite()}.")

            return False
