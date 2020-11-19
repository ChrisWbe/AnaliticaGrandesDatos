-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname 
--    FROM 
--        u 
--    WHERE 
--        SUBSTRING(firstname, 0, 1) >= 'm';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--'[m-zM-Z]'
--name = FOREACH u GENERATE (SUBSTRING(firstname,0,1)>='M' ? firstname:'null') AS firstname;
--name = FILTER name BY firstname!='null';
coolor = FOREACH u GENERATE firstname AS fn;
zcoolor = FILTER coolor BY (SUBSTRING(fn,0,1) MATCHES '[m-zM-Z]');
STORE zcoolor INTO 'output';
--STORE name INTO 'output';