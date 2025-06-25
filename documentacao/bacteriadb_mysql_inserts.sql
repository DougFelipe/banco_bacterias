use bacteriadb;

DELETE FROM usuario WHERE true;
-- (id, email, nome, senha)
INSERT INTO usuario VALUES 
(1, 'ana.souza@example.com', 'Ana Souza', 'senha123'),
(2, 'carlos.melo@example.com', 'Carlos Melo', 'abcDEF456'),
(3, 'mariana.lima@example.com', 'Mariana Lima', 'lim@2025'),
(4, 'joao.silva@example.com', 'João Silva', 'joao#senha'),
(5, 'beatriz.alves@example.com', 'Beatriz Alves', 'btrz!789');

DELETE FROM isolado WHERE true;
-- (id, usuario_isola_id, usuario_coleta_id, nome, meio_cultura, temperatura, origem, cond_oxigenacao) 
INSERT INTO isolado VALUES
(1, 1, 2, 'ISL-001', 'BHI', 30, 'Solo de manguezal', 'Aeróbica'),
(2, 3, 1, 'ISL-002', 'Ágar Nutriente', 28, 'Raiz de cana-de-açúcar', 'Microaerofílica'),
(3, 2, 4, 'ISL-003', 'Ágar Sabouraud', 25, 'Sedimento marinho', 'Anaeróbica'),
(4, 4, 5, 'ISL-004', 'Ágar MacConkey', 37, 'Fezes de animal silvestre', 'Aeróbica'),
(5, 5, 3, 'ISL-005', 'Ágar TSA', 35, 'Água de poço artesiano', 'Facultativa');

DELETE FROM informacoes_deposito WHERE true;
-- (`acession_ncbi`, `isolado_id`, `usuario_id`, `tipo_amostra`, `local_coleta`, `data_coleta`, `data_isolamento`, `cobertura`, `tecnologia`, `metodo_montagem`, `data_montagem`, `versao_genoma`, `responsavel_ncbi`, `identificacao_taxonomia`)
INSERT INTO informacoes_deposito VALUES
('GCA_001000111.1', 1, 1, 'Solo', 'Manguezal - RN', '2024-03-12', '2024-03-15', 120, 'Illumina MiSeq', 'SPAdes', '2024-03-20', 'v1.0', 'Ana Souza', 'Dermacoccus nishinomiyaensis'),
('GCA_001000112.1', 2, 3, 'Raiz vegetal', 'Cana-de-açúcar - PE', '2024-04-02', '2024-04-06', 95, 'Illumina NextSeq', 'Unicycler', '2024-04-10', 'v1.1', 'Carlos Melo', 'Streptomyces griseus'),
('GCA_001000113.1', 3, 2, 'Sedimento marinho', 'Pontal do Sul - PR', '2024-02-18', '2024-02-22', 105, 'Ion Torrent', 'Velvet', '2024-02-28', 'v2.0', 'Mariana Lima', 'Pseudomonas fluorescens'),
('GCA_001000114.1', 4, 4, 'Fezes animal', 'Reserva Ecológica - BA', '2024-01-30', '2024-02-03', 80, 'Illumina HiSeq', 'SPAdes', '2024-02-08', 'v1.0', 'João Silva', 'Escherichia coli'),
('GCA_001000115.1', 5, 5, 'Água', 'Poço artesiano - PB', '2024-05-10', '2024-05-14', 110, 'Oxford Nanopore', 'Flye', '2024-05-18', 'v1.2', 'Beatriz Alves', 'Burkholderia contaminans');

DELETE FROM bancada WHERE true;
-- (`id`, `isolado_id`, `morfologia`, `nome_lbmg`, `cepa`, `coloracao_gram`, `consistencia`, `elevacao`, `textura`, `cor`, `brilho`, `transparencia`, `borda`, `forma`)
INSERT INTO bancada VALUES 
	(1, 1, 'grande', 'BD5', 'BY6', '1', 'suave', 'plana', 'lisa', 'laranja', '1', 'opaca', 'inteira', 'circular'),
	(2, 2, 'pequena', 'BD6', 'BY7', '0', 'áspera', 'plana', 'rugosa', 'branco', '1', 'translúcida', 'ondulada', 'irregular'),
	(3, 3, 'média', 'BD7', 'BY8', '1', 'mucoide', 'convexa', 'lisa', 'amarelo', '0', 'opaca', 'lobulada', 'circular'),
	(4, 4, 'grande', 'BD8', 'BY9', '0', 'seca', 'elevada', 'áspera', 'creme', '1', 'transparente', 'irregular', 'filamentosa'),
	(5, 5, 'pequena', 'BD9', 'BY10', '1', 'úmida', 'umbonada', 'lisa', 'rosa', '1', 'opaca', 'inteira', 'espiralada');

DELETE FROM bioinformatica WHERE true;
-- (`id`, `isolado_id`, `pangenoma`, `antismash`, `ddh`, `ggdc`, `biosurfdb`, `ani`, `ident_tygs`, `ident_shotgun`, `ident_16s`, `sintenia`, `genoma_circular`, `patogenicidade`, `arvore_filogenetica`)
INSERT INTO bioinformatica VALUES
	(1, 1,
	 'Pangenoma com 3.200 genes totais',
	 'antiSMASH: NRPS, PKS-II e terpene detectados',
	 '83.1% (método GBDP)',
	 '85.5% (modelo GGDC fórmula 2)',
	 'Genes de surfactina identificados',
	 '98.9%',
	 'Dermacoccus nishinomiyaensis (TYGS)',
	 'Dermacoccus sp. GCF_000123456.1',
	 'Dermacoccus sp. (16S 99.1%)',
	 'Sintenia com D. nishinomiyaensis',
	 'Genoma circular confirmado',
	 'Sem genes patogênicos detectados',
	 'Relacionamento com Dermacoccus spp.'),

	(2, 2, 
	 '3.450 ortólogos e 1.200 genes únicos',
	 'NRPS, PKS-I, PKS-II, terpene e sideróforo',
	 '83.2% (GBDP)',
	 '85.7% (GGDC fórmula 2)',
	 'Surfactina e fengicina presentes',
	 '98.7%',
	 'Streptomyces griseus NBRC 13350',
	 'Streptomyces sp. GCF_000931635.1',
	 'S. griseus (16S 99.3%)',
	 'Sintenia com S. coelicolor',
	 'Genoma circular único',
	 'Sem patogenicidade detectada',
	 'Clado Streptomycetaceae'),

	(3, 3,
	 '2.980 genes core, 540 exclusivos',
	 'NRPS, bacteriocina, terpeno (antiSMASH)',
	 '70.3%',
	 '72.1%',
	 'Lipopeptídeos detectados',
	 '94.5%',
	 'Bacillus velezensis FZB42',
	 'Bacillus sp. GCF_001021385.1',
	 'B. subtilis (16S 98.9%)',
	 'Sintenia com B. amyloliquefaciens',
	 'Genoma circular',
	 'Sem genes patogênicos',
	 'Relacionamento com B. subtilis'),

	(4, 4,
	 '4.200 genes core, variação 15%',
	 'NRPS e sideróforo em contig 4',
	 '91.0%',
	 '92.5%',
	 'Produção de lipopeptídeos',
	 '99.1%',
	 'P. fluorescens SBW25',
	 'Pseudomonas sp. GCF_000012345.1',
	 'P. fluorescens (16S 99.7%)',
	 'Sintenia com P. putida KT2440',
	 'Genoma linear fragmentado',
	 'Resistência a metais detectada',
	 'Clado Pseudomonadaceae'),

	(5, 5,
	 '2.150 core e 950 específicos',
	 'PKS, NRPS, RiPP e betalactona',
	 '68.5%',
	 '70.2%',
	 'Genes para surfactantes lipídicos',
	 '93.8%',
	 'Burkholderia cepacia complex',
	 'Burkholderia sp. GCF_000456789.1',
	 'B. contaminans (16S 98.5%)',
	 'Sintenia parcial com B. cepacia',
	 'Genoma com alta plasticidade',
	 'Possui genes de virulência',
	 'Clado B. contaminans');

DELETE FROM consorcio WHERE true;
-- (`id`, `nome`, `amostra_origem`, `cond_oxigenacao`, `teste_bioquimico`, `densidade_max`, `analise_enzimatica`, `eficiencia_emulsificacao`, `meio_cultura`, `temperatura`, `resultado_dcpip`, `tempo_dias`)
INSERT INTO consorcio VALUES
(1, 'CNS-001', 'Manguezal - RN', 'Aeróbica', 'Oxid. glicose posit.', 1.25, 'Lipase, protease', 65.4, 'BHI', 30, 'Decolorido em 48h', 7),
(2, 'CNS-002', 'Raiz de cana - PE', 'Microaerofílica', 'Ferment. de lactose', 0.98, 'Amilase', 54.2, 'Ágar TSA', 28, 'Parcial após 72h', 10),
(3, 'CNS-003', 'Sedimento marinho - PR', 'Anaeróbica', 'Redução de nitrato', 1.40, 'Celulase', 72.1, 'Ágar Nutri', 25, 'Negativo', 5),
(4, 'CNS-004', 'Fezes silvestres - BA', 'Aeróbica', 'Produção de catalase', 1.10, 'Protease', 60.0, 'Ágar MacCo', 37, 'Decolorido em 24h', 6),
(5, 'CNS-005', 'Poço artesiano - PB', 'Facultativa', 'Teste oxidase posit.', 0.89, 'Lipase', 49.3, 'Ágar Sabou', 35, 'Leve mudança após 96h', 8);

DELETE FROM isolado_composicao_consorcio WHERE true;
-- (`isolado_id`, `consorcio_id`)
INSERT INTO isolado_composicao_consorcio VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);

DELETE FROM unidade_experimental WHERE true;
-- (`id`, `isolado_id`, `tipo`)
INSERT INTO unidade_experimental VALUES
(1, 1, 'Frasco agitado'),
(2, 2, 'Placa de Petri'),
(3, 3, 'Tubo de ensaio'),
(4, 4, 'Erlenmeyer com agitação'),
(5, 5, 'Frasco estático');

DELETE FROM curva_crescimento WHERE true;
-- (`id`, `ugcurva_id`, `tempo_horas`, `densidade_optica`, `tipo_substrato`, `uexperimental_id`, `data`, `responsavel`)
INSERT INTO curva_crescimento VALUES
(1, 1, 0, '0.05', 'Glicose 1%', 1, '2025-06-10', 'Ana Souza'),
(2, 1, 4, '0.22', 'Glicose 1%', 1, '2025-06-10', 'Ana Souza'),
(3, 2, 0, '0.07', 'Glicerol 0.5%', 2, '2025-06-11', 'Carlos Melo'),
(4, 2, 6, '0.35', 'Glicerol 0.5%', 2, '2025-06-11', 'Carlos Melo'),
(5, 3, 8, '0.78', 'Óleo Diesel 2%', 3, '2025-06-12', 'Mariana Lima');
