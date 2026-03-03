

DO $$
DECLARE
    codigo INTEGER := 1;
    nome_completo VARCHAR(100):= 'João Silva';
    salario NUMERIC(11, 2) := 20.5;
BEGIN
    RAISE NOTICE 'Meu código é %, me chamo % e meu salário é R$%', codigo, nome_completo, salario;
END;
$$

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