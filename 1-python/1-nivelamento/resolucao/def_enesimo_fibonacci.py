# TODO: 10. Retornar o enésimo número da sequência de fibonacci
# TODO: 10.I. Criar funcao recursiva
def enesimo_fibonacci(n, fibo_ant=0, fibo_prox=1, count=0):
    if count == (n - 1):
        return fibo_prox
    return enesimo_fibonacci(n, fibo_ant=fibo_prox, fibo_prox=(fibo_prox + fibo_ant), count=count + 1)
