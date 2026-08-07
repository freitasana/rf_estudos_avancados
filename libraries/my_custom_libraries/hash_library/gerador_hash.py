import  hashlib


def gerar_hash(conteudo):
    hash_conteudo = hashlib.sha256(conteudo.encode("utf-8")).hexdigest()

    print(f"Conteúdo: {conteudo}")
    print(f"Hash gerado: {hash_conteudo}")

    return hash_conteudo


def gerar_hash_arquivo(filename):

    print("Arquivo : {}".format(filename))
    h = hashlib.sha256()

    with open (filename,'rb') as file:
        while chunk:= file.read(1024):
            h.update(chunk)
    
    print ("Hash gerado: {}".format(h.hexdigest()))

    return h.hexdigest()    