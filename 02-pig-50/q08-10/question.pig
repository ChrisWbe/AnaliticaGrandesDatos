-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r pig_*;
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
        AS (letra_mayus:CHARARRAY, 
            letras:bag{}, 
            clave:map[]);
t1 = FOREACH data GENERATE letras, FLATTEN($2) AS clave;
t2 = FOREACH t1 GENERATE letras AS letras:bag{}, clave AS clave:CHARARRAY;
t3 = FOREACH t2 GENERATE FLATTEN(letras) AS letras , clave;
agrup = GROUP t3 BY (letras, clave);
resp_cont = FOREACH agrup GENERATE $0, COUNT($1);
STORE resp_cont INTO 'output' USING PigStorage('\t');