--exibir os nomes dos youtubers que começaram a partir de 2010 e tem, pelo menos, 60 milhoes de inscritos,
--usando um parametro nomeado e outro pela ordem

DO $$
DECLARE
	cur_ano_inscritos CURSOR FOR SELECT youtuber from tb_top_youtubers 
	WHERE started >= ano AND subscribers >= inscritos;;
BEGIN

END;
$$

--fazer um cursor vinculado para exibir o nome de cada youtuber e seu numero de inscricoes
/* DO $$
DECLARE
	--Declaracao
	cur_youtuber_inscritos CURSOR FOR 
	SELECT youtuber, subscribers FROM tb_top_youtubers ;
	tupla RECORD;
	resultado TEXT DEFAULT '';
BEGIN
	--Abertura
	OPEN cur_youtuber_inscritos;
	--Recuperacao
	FETCH cur_youtuber_inscritos INTO tupla;
	WHILE FOUND
	LOOP
		resultado := resultado || tupla.youtuber || ': ' || tupla.subscribers || ', ';
		FETCH cur_youtuber_inscritos INTO tupla;
	END LOOP;
	--Fechamento
	CLOSE cur_youtuber_inscritos;
	RAISE NOTICE '%', resultado;
END;
$$ */

--exibir nomes dos youtubers que começaram a partir de um ano especifico. desafio: fazer
-- com query dinâmica. o cursor tem que ser não vinculado
/* DO $$
DECLARE
	cur_nomes_a_partir_de REFCURSOR;
	v_youtuber VARCHAR(200);
	v_ano INT := 2020;
	v_nome_tabela VARCHAR(200) := 'tb_top_youtubers';
BEGIN
	OPEN cur_nomes_a_partir_de FOR EXECUTE
	format('SELECT youtuber FROM %s WHERE started >= $1', v_nome_tabela) USING v_ano;
	LOOP
		FETCH cur_nomes_a_partir_de INTO v_youtuber;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '%', v_youtuber;
	END LOOP;
	CLOSE cur_nomes_a_partir_de;
END;
$$ */

/* DO $$
DECLARE
	-- 1. Declaração do cursor não vinculado (unbound)
	cur_nomes_youtubers REFCURSOR;
	v_youtuber VARCHAR(200);	
BEGIN
	--2. abertura do cursor
	OPEN cur_nomes_youtubers FOR
	SELECT youtuber FROM tb_top_youtubers;
	LOOP
	--3. Recuperação dos dados de interesse
	FETCH cur_nomes_youtubers INTO v_youtuber;
	--FOUND é uma variável especial que indica
	EXIT WHEN NOT FOUND;
	RAISE NOTICE '%', v_youtuber;
	END LOOP;
	--4. Fechamento do cursos
	CLOSE cur_nomes_youtubers;
END;
$$ */

/* SELECT * from tb_top_youtubers; */

/* CREATE TABLE tb_top_youtubers(
cod_top_youtubers SERIAL PRIMARY KEY,
rank INT,
youtuber VARCHAR(200),
subscribers INT,
video_views VARCHAR(200),
video_count INT,
category VARCHAR(200),
started INT
); */