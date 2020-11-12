CREATE PROCEDURE GbpEurYearsAgo @YearsAgo int
AS
SELECT 
	fcr.*, dc.CurrencyAlternateKey 
FROM 
	FactCurrencyRate fcr 
INNER JOIN 
	DimCurrency dc 
ON 
	fcr.CurrencyKey = dc.CurrencyKey
WHERE 
	DATEDIFF(yy, Date, GETDATE()) = @YearsAgo AND MONTH(Date) = MONTH(GETDATE()) AND DAY(Date) = DAY(GETDATE())
	AND CurrencyAlternateKey IN ('EUR', 'GBP')

	--EXEC GbpEurYearsAgo @YearsAgo = 8

	/* Odpowiedzi -->
	zad.4 b) Co to jest LookUp No Match Output, co i kiedy zostanie tam zapisane.
	LookupNoMatchOutput jest to wyjœcie z funkcji lookup gdzie tabela s³ownikowa nie ma
	bezpoœredniego po³aczenia z tabel¹ aktualnie przetwarzan¹ (wejœcie do funkcji/komponentu
	Lookup. Czyli na wyjœcie, do tymczasowego wyjœcia
	zostan¹ wypisane rekordy które w aktualnie przetwarzanej tabeli nie maj¹ 
	powi¹zania w tabeli s³ownikowej.

	zad.9. e) SQL pobiera i modyfikuje dane, ETL przygotowuje dane. ETL to „warstwa integracji danych”.
	Jego sk³adniki dziel¹ siê na te trzy obszary:
	Extract - Pierwsza czêœæ procesu. Etap ten identyfikuje
	ró¿ne Ÿród³a danych, odkrywa czêstotliwoœæ odœwie¿ania 
	ka¿dego Ÿród³a i ustala miêdzy nimi priorytety.
	Transform - Gdy proces wyodrêbniania wyci¹ga dane, proces przekszta³cania
	nadaje im pozór porz¹dku. Coœ jak porz¹dkowanie i organizacja danych
	Load - Ostateczny proces który okreœla nowe cele. Faza ta ma 
	te¿ kluczowe znaczenie. Proces tutaj okreœla czy wymaga
	przyrostów standardowych czy w formie "upsert"

	Ogólnie rzecz bior¹c, ETL jest wszechstronnym, elastycznym rozwi¹zaniem 
	danych dla nowego œrodowiska biznesowego.

	Zalety ETL to:

-dobre do masowego przenoszenia danych ze z³o¿onymi regu³ami i przekszta³ceniami
-sprawiaj¹, ¿e konserwacja i identyfikowalnoœæ s¹ znacznie ³atwiejsze ni¿ rêczne kodowanie
-dobre dla œrodowiska hurtowni danych

	Wady ETL obejmuj¹:

-musisz byæ programist¹ zorientowanym na dane lub analitykiem baz danych
-nie jest idealny do dostêpu do danych w czasie zbli¿onym do rzeczywistego lub na ¿¹danie, gdzie wymagana jest szybka odpowiedŸ
-wdro¿enie zajmuje miesi¹ce
-trudno nad¹¿yæ za zmieniaj¹cymi siê wymaganiami */

