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
	LookupNoMatchOutput jest to wyj�cie z funkcji lookup gdzie tabela s�ownikowa nie ma
	bezpo�redniego po�aczenia z tabel� aktualnie przetwarzan� (wej�cie do funkcji/komponentu
	Lookup. Czyli na wyj�cie, do tymczasowego wyj�cia
	zostan� wypisane rekordy kt�re w aktualnie przetwarzanej tabeli nie maj� 
	powi�zania w tabeli s�ownikowej.

	zad.9. e) SQL pobiera i modyfikuje dane, ETL przygotowuje dane. ETL to �warstwa integracji danych�.
	Jego sk�adniki dziel� si� na te trzy obszary:
	Extract - Pierwsza cz�� procesu. Etap ten identyfikuje
	r�ne �r�d�a danych, odkrywa cz�stotliwo�� od�wie�ania 
	ka�dego �r�d�a i ustala mi�dzy nimi priorytety.
	Transform - Gdy proces wyodr�bniania wyci�ga dane, proces przekszta�cania
	nadaje im poz�r porz�dku. Co� jak porz�dkowanie i organizacja danych
	Load - Ostateczny proces kt�ry okre�la nowe cele. Faza ta ma 
	te� kluczowe znaczenie. Proces tutaj okre�la czy wymaga
	przyrost�w standardowych czy w formie "upsert"

	Og�lnie rzecz bior�c, ETL jest wszechstronnym, elastycznym rozwi�zaniem 
	danych dla nowego �rodowiska biznesowego.

	Zalety ETL to:

-dobre do masowego przenoszenia danych ze z�o�onymi regu�ami i przekszta�ceniami
-sprawiaj�, �e konserwacja i identyfikowalno�� s� znacznie �atwiejsze ni� r�czne kodowanie
-dobre dla �rodowiska hurtowni danych

	Wady ETL obejmuj�:

-musisz by� programist� zorientowanym na dane lub analitykiem baz danych
-nie jest idealny do dost�pu do danych w czasie zbli�onym do rzeczywistego lub na ��danie, gdzie wymagana jest szybka odpowied�
-wdro�enie zajmuje miesi�ce
-trudno nad��y� za zmieniaj�cymi si� wymaganiami */

