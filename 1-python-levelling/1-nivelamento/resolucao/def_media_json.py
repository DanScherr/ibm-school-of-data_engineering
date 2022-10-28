# TODO: 11. Manipular JSON nested
def media_json(list_of_dicts: list, soma: int = 0):
    for dict_line in list_of_dicts:
        for key, value in dict_line.items():
            if key == 'im:rating':
                soma += int(value['label'])
    return soma / len(list_of_dicts)
