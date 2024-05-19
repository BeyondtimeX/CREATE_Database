Consultas com INNER JOIN
Exemplo 1: Lista de Veículos em Manutenção com seus Mecânicos Responsáveis
SELECT v.Idveiculo, v.Marca, v.Modelo, q.Nome
FROM veiculo v
INNER JOIN quadrodecolaboradores q
ON v.Idveiculo = q.Idmecanicoresponsavel;

Exemplo 2: Clientes Pessoa Física e os Veículos que possuem
SELECT cpf.Nome, cpf.RG, v.Marca, v.Modelo
FROM clientepessoafisica cpf
INNER JOIN veiculoemmanutencao vm
ON cpf.Idclientepessoafisica = vm.Idveiculo
INNER JOIN veiculo v
ON vm.Idveiculo = v.Idveiculo;

Consultas com LEFT JOIN
Exemplo 1: Lista de Todos os Veículos e seus Mecânicos (incluindo veículos sem mecânicos designados)
SELECT v.Idveiculo, v.Marca, v.Modelo, q.Nome
FROM veiculo v
LEFT JOIN quadrodecolaboradores q
ON v.Idveiculo = q.Idmecanicoresponsavel;

Exemplo 2: Clientes Pessoa Física com os Veículos que possuem (incluindo clientes sem veículos)
SELECT cpf.Nome, cpf.RG, v.Marca, v.Modelo
FROM clientepessoafisica cpf
LEFT JOIN veiculoemmanutencao vm
ON cpf.Idclientepessoafisica = vm.Idveiculo
LEFT JOIN veiculo v
ON vm.Idveiculo = v.Idveiculo;

Consultas com FULL OUTER JOIN
Exemplo 1: Lista Completa de Veículos e seus Mecânicos, incluindo veículos sem mecânicos e mecânicos sem veículos
SELECT v.Idveiculo, v.Marca, v.Modelo, q.Nome
FROM veiculo v
FULL OUTER JOIN quadrodecolaboradores q
ON v.Idveiculo = q.Idmecanicoresponsavel;

Exemplo 2: Clientes Pessoa Física e Jurídica
SELECT cpf.Nome, cpf.RG, cpf.CPF, cpj.Razaosocial, cpj.CNPJ
FROM clientepessoafisica cpf
FULL OUTER JOIN clientepessoajuridica cpj
ON cpf.CPF = cpj.CNPJ;
Consultas com WHERE
Exemplo 1: Lista de Veículos de uma Marca Específica

SELECT Idveiculo, Marca, Modelo, Ano, Placa
FROM veiculo
WHERE Marca = 'Chevrolet';
Exemplo 2: Lista de Clientes Pessoa Física com CPF específico

SELECT Nome, RG, CPF, Datadenascimento, Telefone
FROM clientepessoafisica
WHERE CPF = '12457841545';
Consultas com ORDER BY

Exemplo 1: Lista de Veículos em Ordem Alfabética de Marca
SELECT Idveiculo, Marca, Modelo, Ano, Placa
FROM veiculo
ORDER BY Marca ASC;

Exemplo 2: Lista de Clientes Pessoa Física por Data de Nascimento
SELECT Nome, RG, CPF, Datadenascimento, Telefone
FROM clientepessoafisica
ORDER BY Datadenascimento DESC;

Consultas com GROUP BY
Exemplo 1: Contagem de Veículos por Marca
SELECT Marca, COUNT(*) AS NumeroDeVeiculos
FROM veiculo
GROUP BY Marca;

Exemplo 2: Contagem de Clientes por Data de Nascimento
SELECT Datadenascimento, COUNT(*) AS NumeroDeClientes
FROM clientepessoafisica
GROUP BY Datadenascimento;

Consultas com HAVING
Exemplo 1: Contagem de Veículos por Marca, Filtrando Marcas com Mais de Um Veículo
SELECT Marca, COUNT(*) AS NumeroDeVeiculos
FROM veiculo
GROUP BY Marca
HAVING COUNT(*) > 1;

Exemplo 2: Contagem de Clientes por Data de Nascimento, Filtrando Datas com Mais de Um Cliente
SELECT Datadenascimento, COUNT(*) AS NumeroDeClientes
FROM clientepessoafisica
GROUP BY Datadenascimento
HAVING COUNT(*) > 1;

Exemplo 1: Utilizando CASE WHEN
SELECT 
    Nome,
    CASE 
        WHEN Datadenascimento < TO_DATE('2000-01-01', 'YYYY-MM-DD') THEN 'Nascido antes de 2000'
        ELSE 'Nascido em ou depois de 2000'
    END AS StatusNascimento
FROM 
    clientepessoafisica;

Exemplo 2: Subconsulta
SELECT 
    veiculo.Modelo,
    veiculo.Placa,
    (SELECT Nome 
     FROM quadrodecolaboradores 
     WHERE quadrodecolaboradores.Idmecanicoresponsavel = veiculoemmanutencao.Nomedomecanicoresponsavel) AS NomeMecanico
FROM 
    veiculoemmanutencao
JOIN 
    veiculo ON veiculo.Idveiculo = veiculoemmanutencao.Idveiculo
WHERE 
    Situacaoatual IS NOT NULL;

Exemplo 3: Subconsulta com CASE WHEN

SELECT 
    Nome,
    'Pessoa Física' AS TipoCliente
FROM 
    clientepessoafisica
UNION ALL
SELECT 
    Razaosocial AS Nome,
    'Pessoa Jurídica' AS TipoCliente
FROM 
    clientepessoajuridica;


