DO $$
DECLARE
 valor INT := fn_valor_aleatorio_entre(1, 12);
 mensagem VARCHAR(200);
BEGIN
 RAISE NOTICE 'Valor gerado: %', valor;
 CASE valor
  WHEN 1,3,5,7,9 THEN
   mensagem := 'impar';
  WHEN 2,4,6,8,10 THEN
   mensagem := 'par';
  ELSE
   mensagem := 'Fora do intervalo'; 
 END CASE;
 RAISE NOTICE '%', mensagem;
END;
$$

DO $$
DECLARE
 valor INT;
 mensagem VARCHAR(200);
BEGIN
 valor := fn_valor_aleatorio_entre(1, 12);
 RAISE NOTICE 'O valor gerado é %', valor;
 CASE valor
  WHEN 1 THEN
   mensagem := 'impar';
  WHEN 3 THEN
   mensagem := 'impar';
  WHEN 5 THEN
   mensagem := 'impar'; 
  WHEN 2 THEN
   mensagem := 'par';
  WHEN 4 THEN
   mensagem := 'par';
  WHEN 6 THEN
   mensagem := 'par';
  ELSE
   mensagem := 'Valor fora do intervalo'; 
 END CASE;
 RAISE NOTICE '%', mensagem;
END;
$$

DO $$
DECLARE
 a INT := fn_valor_aleatorio_entre(0, 20);
 b INT := fn_valor_aleatorio_entre(0, 20);
 c INT := fn_valor_aleatorio_entre(0, 20);
 delta NUMERIC(10, 2);
 raizUm NUMERIC(10, 2);
 raizDois NUMERIC(10, 2);
BEGIN
 RAISE NOTICE 'Equacao %x% + %x + % = 0', a, U&'\00B2', b, c;
 IF a = 0 THEN
  RAISE NOTICE 'Nao é uma equacao do segundo grau';
 ELSE
  delta := b ^ 2 - 4*a*c;
  RAISE NOTICE 'Delta = %', delta;
  
  IF delta = 0 THEN
   raizUm := (-b + |/delta) / (2 * a);
   RAISE NOTICE 'Tem raizUm igual a %', raizUm;
  ELSEIF delta >= 0 THEN
   raizUm := (-b + |/delta) / (2 * a);
   raizDois := (-b - |/delta) / (2 * a);
   RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
  ELSE
   RAISE NOTICE 'Nao existem raizes';
  --Calcular Delta
  --Se delta for negativo, dizer que nao tem raiz
  --Se delta for igual a zero dizer que tem uma raiz e mostrar
  --Se delta for maior do que zero, dizer que tem duas raizes e mostrar ambas
  END IF; 
 END IF;
END;
$$

DO $$
DECLARE
 valor INT := fn_valor_aleatorio_entre(1, 100);
BEGIN
 RAISE NOTICE 'Valor gerado: %', valor;
 IF valor % 2 = 0 THEN
  RAISE NOTICE '% é par', valor;
 ELSE
  RAISE NOTICE '% é impar', valor;
 END IF;
END;
$$

DO $$
DECLARE
 valor INT;
BEGIN
 SELECT fn_valor_aleatorio_entre(1, 30) INTO valor;
 RAISE NOTICE 'Valor gerado: %', valor;
 IF valor BETWEEN 1 AND 20 THEN
  RAISE NOTICE 'A metade do valor % é % ', valor, valor / 2;
 END IF;
END;
$$

DO $$
DECLARE
    valor INT;
BEGIN
 valor := fn_valor_aleatorio_entre(1, 30);
 RAISE NOTICE 'Valor gerado: %', valor;
 IF valor <= 20 THEN
  RAISE NOTICE 'o valor % é menor do que 20', valor;
 END IF;
END;
$$

SELECT fn_valor_aleatorio_entre(5, 17);

CREATE OR REPLACE FUNCTION fn_valor_aleatorio_entre(lim_infe INT, lim_superior INT)
RETURNS INT AS $$
BEGIN
 RETURN FLOOR(RANDOM() * (lim_superior - lim_infe + 1) + lim_infe)::INT;
END;
$$ LANGUAGE plpgsql;

--1 10
--FLOOR(RANDOM() * 10) + 1

--5 17
--FLOOR(RANDOM() * (17 - 5) + 1) + 5