-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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

minusculas_ = FOREACH data GENERATE FLATTEN(minusculas) AS letra:chararray;

minusculas_1 = GROUP minusculas_ BY letra;
wordcount = FOREACH minusculas_1 GENERATE group, COUNT(minusculas_);

STORE wordcount INTO 'output';
