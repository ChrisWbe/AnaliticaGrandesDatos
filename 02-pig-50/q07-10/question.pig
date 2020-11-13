-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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
    d:map[]
);

datos = FOREACH data GENERATE letra, SIZE(minusculas) AS minusculas, SIZE(d) AS d;

orden = ORDER datos BY letra ASC, minusculas ASC, d ASC;

STORE orden INTO 'output' USING PigStorage(',');