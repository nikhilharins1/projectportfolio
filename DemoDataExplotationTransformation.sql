-- Pregunta 1 - Usando la tabla COUNTRIES (paises) construye una consulta que obtenga la lista de todos los países de Asia. En base al resultado de la consulta, ¿cuantos paises hay en Asia?
SELECT
    COUNTRY_ID,
    COUNTRY_NAME,
    COUNTRY_REGION
FROM
    SH.COUNTRIES
WHERE COUNTRY_REGION = 'Asia';

-- Respuesta - 6

-- Pregunta 2 Pregunta 2 - Usando la tabla CUSTOMERS (clientes), construye una consulta que obtenga la lista de todos los clientes cuyo estado marital (CUST_MARITAL_STATUS) esté en blanco y su ciudad (CUST_CIY) sea Pune. En base al resultado de la consulta, ¿Cuántos clientes son?
SELECT
    CUST_ID,
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    CUST_GENDER,
    CUST_YEAR_OF_BIRTH,
    CUST_MARITAL_STATUS,
    CUST_STREET_ADDRESS,
    CUST_POSTAL_CODE,
    CUST_CITY,
    CUST_CITY_ID,
    CUST_STATE_PROVINCE,
    CUST_STATE_PROVINCE_ID,
    COUNTRY_ID,
    CUST_MAIN_PHONE_NUMBER,
    CUST_INCOME_LEVEL,
    CUST_CREDIT_LIMIT,
    CUST_EMAIL,
    CUST_TOTAL,
    CUST_TOTAL_ID,
    CUST_SRC_ID,
    CUST_EFF_FROM,
    CUST_EFF_TO,
    CUST_VALID
FROM
    SH.CUSTOMERS
WHERE CUST_MARITAL_STATUS IS NULL
AND   CUST_CITY = 'Pune';

--Respuesta - 95

-- Pregunta 3 - Usando la tabla CUSTOMERS (clientes), construye una consulta que obtenga la lista de todos los clientes donde el limite de credito (CUST_CREDIT_LIMIT) esté entre 9.000 y 10.000, y el año de nacimiento (CUST_YEAR_OF_BIRTH) sea 1993 y el segundo apellido (CUST_LAST_NAME) sea "Mahood". En base al resultado de la consulta, ¿Cuántos clientes son?

SELECT
    CUST_ID,
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    CUST_GENDER,
    CUST_YEAR_OF_BIRTH,
    CUST_MARITAL_STATUS,
    CUST_STREET_ADDRESS,
    CUST_POSTAL_CODE,
    CUST_CITY,
    CUST_CITY_ID,
    CUST_STATE_PROVINCE,
    CUST_STATE_PROVINCE_ID,
    COUNTRY_ID,
    CUST_MAIN_PHONE_NUMBER,
    CUST_INCOME_LEVEL,
    CUST_CREDIT_LIMIT,
    CUST_EMAIL,
    CUST_TOTAL,
    CUST_TOTAL_ID,
    CUST_SRC_ID,
    CUST_EFF_FROM,
    CUST_EFF_TO,
    CUST_VALID
FROM
    SH.CUSTOMERS
WHERE
    CUST_CREDIT_LIMIT
BETWEEN 
    9000 and 10000
AND 
    CUST_YEAR_OF_BIRTH = 1993
AND 
    CUST_LAST_NAME = 'Mahood'; 
    
--respuesta - 3

-- Pregunta 4 - Usando la tabla CUSTOMERS (clientes), construye una consulta que obtenga la lista de todos los clientes cuyo nombre (CUST_FIRST_NAME) empiece por "Bo" y en su apellido (CUST_LAST_NAME) aparezca la cadena de caracteres "ing". En base al resultado de la consulta, ¿Cuántos clientes son?

SELECT
    CUST_ID,
    CUST_FIRST_NAME,
    CUST_LAST_NAME,
    CUST_GENDER,
    CUST_YEAR_OF_BIRTH,
    CUST_MARITAL_STATUS,
    CUST_STREET_ADDRESS,
    CUST_POSTAL_CODE,
    CUST_CITY,
    CUST_CITY_ID,
    CUST_STATE_PROVINCE,
    CUST_STATE_PROVINCE_ID,
    COUNTRY_ID,
    CUST_MAIN_PHONE_NUMBER,
    CUST_INCOME_LEVEL,
    CUST_CREDIT_LIMIT,
    CUST_EMAIL,
    CUST_TOTAL,
    CUST_TOTAL_ID,
    CUST_SRC_ID,
    CUST_EFF_FROM,
    CUST_EFF_TO,
    CUST_VALID
FROM
    SH.CUSTOMERS
WHERE 
    CUST_FIRST_NAME LIKE 'Bo%'
AND 
    CUST_LAST_NAME  LIKE '%ing%';

--Respuesta 32   

--Pregunta 5 - Usando la tabla SUPPLEMENTARY_DEMOGRAPHICS, construye una consulta que obtenga todos los registros con personas en la familia (HOUSEHOLD_SIZE) igual a 2. Ordenar el resultado por la columna GOLF en orden ascendente y por la columna CRICKET en orden descendente. En base al resultado de la consulta, ¿cual es el CUST_ID de la fila que está en 5º lugar?

SELECT *
FROM 
         SH.SUPPLEMENTARY_DEMOGRAPHICS
WHERE 
         HOUSEHOLD_SIZE = '2'
ORDER BY 
         GOLF ASC,
         CRICKET DESC; 
         
-- Respuesta - 104175

--pregunta 6 - Usando la tabla de ventas (SH.SALES), construye una consulta que agrupando por ID de producto (PROD_ID) muestre la suma de cantidad vendida (QUANTITY_SOLD), la suma de importe vendido (AMOUNT_SOLD) y la media del importe vendido. En base al resultado de la consulta, ¿Cuántos productos diferentes se han vendido

SELECT 
     PROD_ID,
SUM(QUANTITY_SOLD) AS "cantidad vendida",
SUM(AMOUNT_SOLD) AS "importe vendido",
AVG(AMOUNT_SOLD) AS "media de importe vendido"
FROM SH.SALES
GROUP BY PROD_ID;

-- Respuesta - 72

-- Pregunta 7 - Ordena la consulta anterior de mayor a menor de forma que muestre en orden descendente los productos con mayor cantidad vendida. Según el resultado de esa consulta, ¿cual es el ID de producto que tiene el 2º mayor valor de cantidad vendida?

SELECT 
     PROD_ID,
SUM(QUANTITY_SOLD) AS "cantidad vendida",
SUM(AMOUNT_SOLD) AS "importe vendido",
AVG(AMOUNT_SOLD) AS "media de importe vendido"
FROM SH.SALES
GROUP BY PROD_ID
ORDER BY "cantidad vendida" DESC;

--Respuesta - 48

-- pregunta 8 - Ahora ordena la consulta de la pregunta 6 de menor a mayor por la media del importe vendido. Según el resultado de esa consulta, ¿cual es valor del importe medio mas bajo?

SELECT 
     PROD_ID,
SUM(QUANTITY_SOLD) AS "cantidad vendida",
SUM(AMOUNT_SOLD) AS "importe vendido",
AVG(AMOUNT_SOLD) AS "media de importe vendido",
ROUND(AVG(AMOUNT_SOLD), 2) AS "media_importe_vendido"
FROM SH.SALES
GROUP BY PROD_ID
ORDER BY "media_importe_vendido" ASC;

--Respuesta - 7,68

--Pregunta 9 - Haz una consulta que cruce la tabla de ventas (SALES) y productos (PRODUCTS) y selecciona las filas cuyo nombre de producto (PROD_NAME) sea Team Shirt y el ID de promocion (PROMO_ID) sea 33. En base al resultado de la consulta, ¿Cuántas filas te devuelve la consulta?

DESC SH.SALES;

SELECT *
FROM SH.SALES S
INNER JOIN SH.PRODUCTS P
    ON S.PROD_ID = P.PROD_ID
WHERE UPPER(PROD_NAME) LIKE '%TEAM SHIRT%'
  AND S.PROMO_ID = 33;

  -- Respuesta - 134

-- Pregunta 10 - Haz una consulta que cruce la tabla de ventas (SALES), productos (PRODUCTS)  y canal (CHANNELS) y selecciona las filas cuyo canal  (CHANNEL_DESC) sea Direct Sales, y la categoría de producto (PROD_CATEGORY) sea Golf y nombre de producto (PROD_NAME) tenga la palabra Electric y el ID de promocion (PROMO_ID) no sea ni 999 ni 350. En base al resultado de la consulta, ¿Cuántas filas te devuelve la consulta?

SELECT 
      *
FROM SH.SALES S
INNER JOIN SH.PRODUCTS P
    ON S.PROD_ID = P.PROD_ID
INNER JOIN SH.CHANNELS C
    ON S.CHANNEL_ID = C.CHANNEL_ID
WHERE C.CHANNEL_DESC = 'Direct Sales'
AND P.PROD_CATEGORY = 'Golf'
AND P.PROD_NAME LIKE '%Electric%'
AND S.PROMO_ID NOT IN (999, 350) ;

-- Respuesta - 61