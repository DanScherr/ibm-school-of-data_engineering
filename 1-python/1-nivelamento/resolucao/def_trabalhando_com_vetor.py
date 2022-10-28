# TODO: 1.I. e 1.II. Ler e Imprimir vetor
def cria_vetor() -> list:
    try:
        vetor = [int(input("Informe um número inteiro: ")) for i in range(10)]
    except ValueError as error_message:
        print(f"\n -> {error_message} não é um número inteiro. Por favor, repita a operação.")
    except TypeError as error_message:
        print(f"\nVetor: {error_message} não é um número inteiro. Por favor, repita a operação.")
    else:
        print(f"\nVetor: {vetor}")
        return vetor


# TODO: 1.III. Ordenar vetor
def ordenar_vetor(vetor: list, o: str = 'asc') -> list:
    for i in range(len(vetor)-1):
        for j in range(len(vetor)-1):
            if (vetor[j] < vetor[j+1]) and (o == 'dec'):
                vetor[j], vetor[j+1] = vetor[j+1], vetor[j]
            elif (vetor[j] > vetor[j+1]) and (o == 'asc'):
                vetor[j], vetor[j+1] = vetor[j+1], vetor[j]
    return vetor


# TODO: 1.IV.i.a.
def somar_vetor(vetor: list):
    soma = 0
    for item in vetor:
        soma += item
    return soma


# TODO: 1.IV.i.b.
def media_vetor(vetor: list):
    soma = somar_vetor(vetor)
    return soma/len(vetor)


# TODO: 1.IV.i.c.
def mediana_vetor(vetor: list):
    ordenar_vetor(vetor)
    if len(vetor) % 2 == 0:
        meio_vetor = int(len(vetor) / 2)
        mediana = (vetor[meio_vetor-1] + vetor[meio_vetor]) / 2
    else:
        meio_vetor = round(len(vetor) / 2) + 1
        mediana = vetor[meio_vetor]
    return mediana


# TODO: 1.IV.i.d.
def variancia_vetor(vetor: list):
    media = media_vetor(vetor)
    variancia = 0.0
    for item in vetor:
        variancia += ((item - media) ** 2) / len(vetor)
    return variancia


# TODO: 1.IV.i.e.
def desvio_padrao_vetor(vetor: list):
    from math import sqrt
    variancia = variancia_vetor(vetor)
    return round(sqrt(variancia), 2)
