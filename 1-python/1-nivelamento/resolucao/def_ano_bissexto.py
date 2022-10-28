# TODO: 2. Verificar se ano bissexto
def ano_bissexto():
    # TODO: 2.I. Solicitar ano ao usuario
    # TODO: 2.I.a Validar ano
    try:
        ano = int(input("\nFavor informar um ano: "))
    except ValueError as error_message:
        print(f"\n -> {error_message} não é um número inteiro. Por favor, repita a operação.")
    except TypeError as error_message:
        print(f"\n -> {error_message} não é um número inteiro. Por favor, repita a operação.")
    else:
        # TODO: 2.II. Construir função que checa se ano bissexto
        # TODO: 2.II.b. Realizar validações
        divisivel_por_4 = (ano % 4 == 0)
        divisivel_por_100 = (ano % 100 == 0)
        divisivel_por_400 = (ano % 400 == 0)
        # TODO: 2.II.c. Retornar se verdadeiro ou falso (boolean)
        if divisivel_por_4 or divisivel_por_100 or divisivel_por_400:
            return True
        else:
            return False

