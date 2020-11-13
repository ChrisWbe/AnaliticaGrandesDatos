--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      chararray
--   eventType      chararray
--   longitude      float
--   latitude       float
--   eventKey       chararray
--   correlationId  chararray
--   driverName     chararray
--   routeId        BIGINT
--   routeName      chararray
--   eventDate      chararray
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r pig_*;
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
data = LOAD '*.csv' USING PigStorage(',') AS (
   driverId:int,
   truckId:int,
   eventTime:chararray,
   eventType:chararray,
   longitude:float,
   latitude:float,
   eventKey:chararray,
   correlationId:chararray,
   driverName:chararray,
   routeId:long,
   routeName:chararray,
   eventDate:chararray
);

filas = LIMIT data 10;

columns = FOREACH filas GENERATE driverId,truckId,eventTime;

orden_ = ORDER columns BY driverId ASC,truckId ASC,eventTime ASC;

STORE orden_ INTO 'output' USING PigStorage(',');