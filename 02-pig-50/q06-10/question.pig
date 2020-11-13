-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r pig_*;
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD '*.tsv' USING PigStorage('\\t') AS (
    letra:chararray,
    minusculas:bag{},
    datos:map[]
);

datos = FOREACH data GENERATE FLATTEN(datos) AS registro:chararray;
datos_ = GROUP datos BY registro;
wordcount = FOREACH datos_ GENERATE group, COUNT(datos);

STORE wordcount INTO 'output' USING PigStorage(',');