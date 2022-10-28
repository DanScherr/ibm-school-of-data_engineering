# TODO: 3. Concatenar String a um vetor de Strings
def concat_str_vetor_str():
    # TODO: 3.I. Solicitar vetor de string ao usuário
    # TODO: 3.I.a. validar string
    vetor = list(str(input("\nInsira uma frase separada por espaços: ")))
#   # TODO: 3.II. Solicitar string para concatenar
    string = str(input("\nInsira uma String para ser concatenada: "))
#   TODO: 3.II.a. concatenar string para cada index do vetor
    frase = []
    for index, word in enumerate(vetor):
        if word == ' ':
            frase.append(string)
        frase.append(word)
    frase.append(string)
     
    return ''.join(str(e) for e in frase)
