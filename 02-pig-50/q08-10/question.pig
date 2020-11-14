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
data = LOAD '*.tsv' USING PigStorage('\\t') AS (
    letra:chararray,
    minusculas:bag{},
    d:map[]
);

datos = FOREACH data GENERATE FLATTEN(minusculas) AS minusculas:chararray, FLATTEN(d) AS d:chararray;
orden = ORDER datos BY minusculas ASC, d ASC;
orden_unique = DISTINCT orden;
grouped = GROUP orden_unique ALL;
dump grouped;
uniq_count = FOREACH grouped GENERATE COUNT(orden_unique);

dump uniq_count;

--user_data = LOAD 'myTestData' USING PigStorage('\t') AS (a1,a2,a3);
--users = FOREACH user_data GENERATE a3;
--uniq_users = DISTINCT users;
--grouped_users = GROUP uniq_users ALL;
--uniq_user_count = FOREACH grouped_users GENERATE COUNT(uniq_users);
--DUMP uniq_user_count;

--grouped = GROUP datos by minusculas;

--dump grouped;