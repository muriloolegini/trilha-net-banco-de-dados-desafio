--Passo 1: Buscar o nome e ano dos filmes.
SELECT Nome, Ano FROM Filmes

--Passo 2: Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano.
SELECT Nome, Ano, Duracao FROM Filmes ORDER BY Ano

--Pass 3: Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração.
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Nome = 'De Volta para o Futuro'
ORDER BY Ano, Duracao

--Passo 4: Buscar os filmes lançados em 1997.
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Ano = '1997'

--Passo 5: Buscar os filmes lançados APÓS o ano 2000.
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano > 2000

--Passo 6: Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente.
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao

--Passo 7: Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente.
SELECT Ano,
	   COUNT(*) Quantidade
FROM Filmes
WHERE Ano <> ''
GROUP BY Ano
ORDER BY Quantidade DESC

--Passo 8: Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome.
SELECT * FROM Atores WHERE Genero = 'M'

--Passo 9: Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome.
SELECT * FROM Atores WHERE Genero = 'F' 
ORDER BY PrimeiroNome

--Passo 10: Buscar o nome do filme e o gênero.
SELECT 
	Nome,
	Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme 
--INNER JOIN Generos ON FilmesGenero.Id = Generos.Id
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id

--Passo 11: Buscar o nome do filme e o gênero do tipo "Mistério".
SELECT
	f.Nome,
	g.Genero
FROM Filmes f
INNER JOIN FilmesGenero fg ON f.Id = fg.IdFilme
INNER JOIN Generos g ON fg.IdGenero = g.Id
WHERE g.Genero = 'Mistério'

--Passo 12: Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel.
SELECT
	f.Nome,
	a.PrimeiroNome,
	a.UltimoNome,
	ef.Papel
FROM Filmes f
INNER JOIN ElencoFilme ef ON f.Id = ef.IdFilme
INNER JOIN Atores a ON ef.IdAtor = a.Id
