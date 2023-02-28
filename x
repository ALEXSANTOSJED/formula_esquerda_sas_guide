/* Note na linha 9 que transformo a coluna em texto e extraio os 2 últimos dígitos usando a fórmula substr(5,2), que é = a partir do 5 caracter trazer os dois 
2 caracteres seguintes, depois disso transformo o resultado em número, pois o Guide tem essa diferença de coluna número e texto e pode dar conflito em cálculos 
e joins, caso não esteja correto este formato */

%_eg_conditional_dropds(WORK.QUERY_FOR_MICHELANGELO_PONTE_CON);

PROC SQL;
   CREATE TABLE WORK.QUERY_FOR_MICHELANGELO_PONTE_CON AS 
   SELECT DISTINCT t1.CD_ALNO AS ALUCOD, 
          /* SERIE_BOLETO */
            (((((INPUT(((SUBSTR((COMPRESS((PUT(t1.COMPETENCIA,BEST11.)))), 5,2))), commax32.)))))
            
            
            ) AS SERIE_BOLETO, 
          /* VALOR ROL */
            (SUM(t1.VALOR)) FORMAT=COMMAX16.2 AS 'VALOR ROL'n
      FROM SASPUBLI.MICHELANGELO_PONTE_CONTABIL t1
      GROUP BY t1.CD_ALNO,
               (CALCULATED SERIE_BOLETO);
QUIT;
