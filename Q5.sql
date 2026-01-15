-- EXTRAI A MÉDIA DE DURAÇÃO DO TIPO DE ATAQUE Backdoor E SERVIÇO ftp
SELECT UNT.ATTACK_CAT,
       ROUND(AVG(N.DUR),2) AS MEDIA_DURACAO
FROM UNSW_NB15_TRAINING UNT
INNER JOIN NEW N ON N.CD = UNT.CD
WHERE UNT.ATTACK_CAT = 'Backdoor'
	AND UNT.SERVICE = 'ftp'
GROUP BY UNT.ATTACK_CAT
ORDER BY MEDIA_DURACAO;


/*1. JOIN entre UNSW_NB15_TRAINING e NEW

A tabela NEW é utilizada para acessar a coluna DUR já convertida para formato numérico.
O vínculo é feito pelo campo CD.

2. Filtragem dos registros

Apenas registros onde:
ATTACK_CAT = 'Backdoor'
SERVICE = 'ftp'

3. Cálculo da média

A função AVG(N.DUR) calcula a média da duração, arredondada para duas casas decimais com ROUND.

4. Agrupamento e ordenação

A média é agrupada por tipo de ataque.
A ordenação é crescente, embora exista apenas um grupo devido ao filtro.
Objetivo: Identificar quanto tempo, em média, duram as conexões associadas a ataques de Backdoor que utilizam o protocolo FTP, permitindo análises sobre a persistência desse tipo de ataque dentro do dataset.*/