-- VERIFICA SE EXISTE ALGUMA LINHA EM BRANCO DA COLUNA SERVICE
SELECT COUNT(*) AS EM_BRANCO
FROM UNSW_NB15_TRAINING
WHERE SERVICE IS NULL

-- LISTA OS TIPOS DE SERVIÇOS DA COLUNA SERVICE
SELECT DISTINCT SERVICE AS TP_SERVICO
FROM UNSW_NB15_TRAINING

-- EXTRAI A QUANTIDADE DE VEZES QUE HOUVE UM ATAQUE DO TIPO DoS E O SERVIÇO ERA http
SELECT ATTACK_CAT AS TP_ATAQUE,
	   SERVICE AS TP_SERVICO,
	   COUNT(*) AS QTD_ATQ 
FROM UNSW_NB15_TRAINING
WHERE ATTACK_CAT = 'DoS'
    AND SERVICE = 'http'
GROUP BY ATTACK_CAT, SERVICE


/*1. Verificação de valores em branco na coluna SERVICE

A primeira query contabiliza quantas linhas na tabela UNSW_NB15_TRAINING possuem a coluna SERVICE com valor NULL.
Objetivo: detectar problemas de qualidade dos dados relacionados ao serviço registrado em cada conexão de rede.

2. Listagem dos diferentes serviços existentes na coluna SERVICE

A segunda query retorna todos os valores distintos presentes na coluna SERVICE.
Objetivo: identificar todos os tipos de serviços de rede encontrados no dataset.

3. Quantificação de ataques DoS com serviço HTTP

A terceira query calcula quantas vezes ocorreu um ataque da categoria DoS em que o serviço associado era http.
Objetivo: medir a frequência de ataques DoS especificamente direcionados ao serviço HTTP, permitindo análises mais detalhadas por tipo de ataque e serviço.*/