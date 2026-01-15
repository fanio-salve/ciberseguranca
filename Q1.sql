-- VERIFICA SE EXISTE ALGUMA LINHA EM BRANCO DA COLUNA ATTACK_CAT
SELECT COUNT(*) AS EM_BRANCO 
FROM UNSW_NB15_TRAINING
WHERE ATTACK_CAT IS NULL

-- LISTA OS TIPOS DE ATAQUES DA COLUNA ATTACK_CAT
SELECT DISTINCT ATTACK_CAT AS TP_ATTACK_CAT
FROM UNSW_NB15_TRAINING

-- EXTRAI A QUANTIDADE DE VEZES QUE HOUVE UM ATAQUE DO TIPO Exploits
SELECT ATTACK_CAT AS TP_ATAQUE,
	   COUNT (*) AS QTD_ATQ
FROM UNSW_NB15_TRAINING
WHERE ATTACK_CAT = 'Exploits'
GROUP BY ATTACK_CAT;


/*1. Verificação de valores nulos em attack_cat

A primeira query conta quantas linhas da tabela UNSW_NB15_TRAINING possuem a coluna ATTACK_CAT vazia (NULL).
Objetivo: validar integridade dos dados e identificar possíveis inconsistências.

2. Listagem das categorias de ataque disponíveis

A segunda query retorna todos os valores distintos presentes na coluna ATTACK_CAT.
Objetivo: identificar todos os tipos de ataques registrados no dataset.

3. Contagem de ataques do tipo “Exploits”

A terceira query calcula quantas vezes o ataque da categoria Exploits ocorre na tabela.
Objetivo: quantificar a frequência desse tipo específico de ataque.*/