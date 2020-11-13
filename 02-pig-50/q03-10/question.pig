-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD '*.tsv' USING PigStorage('\\t') AS (
    letra:chararray,
    fecha:chararray,
    numero:int
);


order_by_number = ORDER data BY numero ASC;

select = FOREACH order_by_number GENERATE numero; 

number = LIMIT select 5;
STORE number INTO 'output';