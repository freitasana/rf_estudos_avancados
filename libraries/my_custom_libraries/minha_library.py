from robot.api import logger
from robot.api.deco import keyword

@keyword
def gerar_email(nome):
    return f"{nome.lower()}@teste.com"


@keyword
def exibir_email(email):
    logger.info(f"E-mail gerado: {email}")