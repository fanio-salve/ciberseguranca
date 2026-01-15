-- VERIFICA SE EXISTE ALGUMA LINHA EM BRANCO DA COLUNA PROTO
SELECT COUNT(*) AS EM_BRANCO 
FROM UNSW_NB15_TRAINING
WHERE PROTO IS NULL

-- LISTA OS TIPOS DE PROTOCOLO DA COLUNA PROTO
SELECT DISTINCT PROTO 
FROM UNSW_NB15_TRAINING

-- EXTRAI O PROTOCOLO MAIS COMUM PARA O TIPO DE ATAQUE Schellcode
SELECT PROTO AS PROTOCOLO,
       COUNT(*) AS QTD_ATQ
FROM UNSW_NB15_TRAINING
WHERE ATTACK_CAT = 'Shellcode'
GROUP BY PROTO
ORDER BY QTD_ATQ DESC
FETCH FIRST 1 ROW ONLY;


/*1. Verificação de valores em branco na coluna PROTO

A primeira query conta quantas linhas possuem valor NULL na coluna PROTO.
Objetivo: verificar se há registros sem definição de protocolo, garantindo a qualidade dos dados utilizados nas análises de tráfego de rede.

2. Listagem dos diferentes protocolos presentes na coluna PROTO

A segunda query retorna todos os valores distintos registrados na coluna PROTO.
Objetivo: identificar todos os protocolos de comunicação observados no dataset, como TCP, UDP, ICMP, entre outros.

3. Identificação do protocolo mais comum no ataque do tipo “Shellcode”

A terceira query calcula qual protocolo aparece com maior frequência nas entradas onde o tipo de ataque (ATTACK_CAT) é Shellcode.
Ela agrupa por protocolo, conta as ocorrências e retorna somente o mais frequente.
Objetivo: determinar qual protocolo é mais utilizado ou explorado nos ataques classificados como Shellcode, auxiliando análises de padrões de comportamento malicioso.*/