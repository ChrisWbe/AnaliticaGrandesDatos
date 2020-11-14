-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r pig_*;
fs -rm -f -r output;
--
data = LOAD '*.csv' USING PigStorage(',') AS (
    num:int,
    nombre:chararray,
    apellido:chararray,
    fechas:chararray,
    color:chararray,
    val:int
);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

datos = FOREACH data GENERATE apellido AS apellido,SIZE(apellido) AS tam;

datos = ORDER datos BY tam DESC, apellido ASC;
datos = limit datos  5;

STORE datos INTO 'output' USING PigStorage(',') ;