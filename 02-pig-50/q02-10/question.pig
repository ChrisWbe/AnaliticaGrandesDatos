-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r pig_*;
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
data = LOAD '*.tsv' USING PigStorage('\\t') AS (
    letra:chararray,
    fecha:chararray,
    numero:int
);

order_by_number = ORDER data BY letra ASC, numero ASC;

STORE order_by_number INTO 'output';