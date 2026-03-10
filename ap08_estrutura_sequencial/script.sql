DO $$
-- IMMUTABLE a funçao randon gera valores reais no intervalo 0 <= n < 1 
DECLARE
    n1 NUMERIC(5, 2);
    n2 INTEGER;
    limite_inferior INTEGER := 5;
    limite_superior INTEGER := 17;
BEGIN
    n1 := random(); -- 0 <= n1 < 1
    RAISE NOTICE '%', n1;
    n1 := random() * 10; -- 0 <= n1 < 10 
    RAISE NOTICE '%', n1;
    n1 := random() * 10 + 1; -- 1 <= n1 < 11
    RAISE NOTICE '%', n1;
    n2 := floor(random() * 10 + 1)::int; -- 1 <= n2 <= 10
    RAISE NOTICE '%', n2;
    -- 5 <= n2 <= 21
    n2 := floor(random() * (limite_superior - limite_inferior + 1) + limite_inferior)::int;
    RAISE NOTICE '%', n2;
END;
$$

-- DO $$
-- DECLARE
--     codigo INTEGER := 1;
--     nome_completo VARCHAR(100):= 'João Silva';
--     salario NUMERIC(11, 2) := 20.5;
-- BEGIN
--     RAISE NOTICE 'Meu código é %, me chamo % e meu salário é R$%', codigo, nome_completo, salario;
-- END;
-- $$

-- DO $$
-- BEGIN
-- 	RAISE NOTICE '% + % = %', 2, 2, 2 + 2;
-- END;
-- $$

-- DO
-- $$
-- BEGIN
-- 	RAISE NOTICE 'Meu primeiro bloquinho anônimo';
-- END;
-- $$