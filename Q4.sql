-- VERIFICA SE EXISTE ALGUMA LINHA EM BRANCO DA COLUNA DUR
SELECT COUNT(*) AS EM_BRANCO 
FROM UNSW_NB15_TRAINING
WHERE DUR IS NULL

-- EXTRAI O TIPO DE ATAQUE QUE TEVE A MAIOR MÉDIA DE DURAÇÃO
SELECT UNT.ATTACK_CAT,
	   ROUND(AVG(N.DUR),2) AS MEDIA_DURACAO
FROM UNSW_NB15_TRAINING UNT
INNER JOIN NEW N ON N.CD = UNT.CD
GROUP BY UNT.ATTACK_CAT
ORDER BY MEDIA_DURACAO DESC
FETCH FIRST 1 ROW ONLY;


/*OBS.: AO IMPORTAR OS DADOS DO CSV PARA O BD ORACLE EU IMPORTEI A COLUNA DUR COMO VARCHAR, ONDE NÃO FOI POSSÍVEL CALCULAR A MÉDIA.
CRIEI UMA NOVA TABELA (PARA NÃO PERDER A QUE JÁ TINHA CRIADO) COM O NOME NEW E IMPORTEI AS COLUNAS CD E DUR COM O SEU TIPO CORRETO.*/

/*1. Verificação de valores nulos na coluna DUR

A primeira query conta quantas linhas possuem a coluna DUR com valor NULL na tabela UNSW_NB15_TRAINING.
Objetivo: identificar registros onde a duração da conexão está ausente, avaliando a qualidade dos dados para análises que dependem desse campo.

2. Identificação do tipo de ataque com maior média de duração

A segunda query determina qual categoria de ataque (ATTACK_CAT) apresenta a maior média de duração (DUR).
Ela utiliza:
JOIN entre a tabela original (UNSW_NB15_TRAINING) e a tabela NEW, que contém a coluna DUR já convertida para número.
GROUP BY para calcular a média por tipo de ataque.
ORDER BY DESC para ordenar da maior para a menor média.
FETCH FIRST 1 ROW ONLY para retornar apenas o tipo de ataque com maior duração média.
Objetivo: identificar qual categoria de ataque permanece ativa por mais tempo, permitindo análises comportamentais mais profundas sobre a severidade e persistência dos ataques.*/