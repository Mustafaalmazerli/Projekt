
INSERT INTO Subscribers (Email, Latitude, Longitude, RadiusKm)
VALUES
('user1@example.com', 59.3293, 18.0686, 5.0),   -- Stockholm
('user2@example.com', 59.8586, 17.6389, 10.0),  -- Uppsala
('user3@example.com', 57.7089, 11.9746, 15.0);  -- G�teborg
INSERT INTO Subscribers (Email, Latitude, Longitude, RadiusKm)
VALUES
('mustafaalmazerli@gmail.com', 56.6745, 12.8572, 20.0);  -- Halmstad

SELECT * FROM CrimeEvents;

DELETE FROM CrimeEvents
WHERE CrimeID BETWEEN 501 AND 560;


UPDATE CrimeEvents
SET EventName = LEFT(EventName, CHARINDEX(',', EventName) - 1)
WHERE CHARINDEX(',', EventName) > 0;
SELECT DISTINCT EventName
FROM CrimeEvents;


-- L�gg till en kolumn f�r brottskategori
ALTER TABLE CrimeEvents
ADD CrimeCategory NVARCHAR(50);

-- Uppdatera CrimeCategory baserat p� brottstyp (EventName)
UPDATE CrimeEvents
SET CrimeCategory = CASE
    WHEN EventName IN ('Br�k', 'Misshandel', 'R�n', 'V�ldt�kt', 'Mord/dr�p', 'V�ld/hot mot tj�nsteman', 'Olaga hot', 'Skottlossning', 'Ofredande/f�rargelse', 'Knivlagen', 'Vapenlagen', 'Narkotikabrott') THEN 'V�ldsbrott'
    WHEN EventName IN ('St�ld', 'Inbrott', 'Bedr�geri', 'Motorfordon', 'Skadeg�relse', '�ldringsbrott', 'Olaga intr�ng', 'St�ld/inbrott', 'Hemfridsbrott', 'H�leri') THEN 'Egendomsbrott'
    WHEN EventName IN ('Trafikbrott', 'Trafikkontroll', 'Trafikolycka', 'Trafikhinder', 'Rattfylleri', 'Olovlig k�rning') THEN 'Trafikrelaterade brott'
    WHEN EventName IN ('Antr�ffad d�d', 'Arbetsplatsolycka', 'Brand', 'Djur', 'Explosion', 'Farligt f�rem�l', 'Fj�llr�ddning', 'Fylleri/LOB', 'F�rsvunnen person', 'Kontroll person/fordon', 'Larm Inbrott', 'Polisinsats/kommendering', 'Sammanfattning kv�ll och natt', 'Sammanfattning natt', '�vrigt') THEN '�vriga incidenter'
    ELSE 'Ok�nd kategori'
END;

SELECT * 
from CrimeEvents;


-- L�gg till kolumn f�r tid p� dagen
ALTER TABLE CrimeEvents
ADD TimeOfDay NVARCHAR(20);

-- L�gg till kolumn f�r veckodag
ALTER TABLE CrimeEvents
ADD Weekday NVARCHAR(20);

-- Uppdatera TimeOfDay och Weekday baserat p� EventDate
UPDATE CrimeEvents
SET TimeOfDay = CASE
    WHEN DATEPART(HOUR, EventDate) BETWEEN 6 AND 12 THEN 'Morgon'
    WHEN DATEPART(HOUR, EventDate) BETWEEN 12 AND 18 THEN 'Eftermiddag'
    WHEN DATEPART(HOUR, EventDate) BETWEEN 18 AND 22 THEN 'Kv�ll'
    ELSE 'Natt'
END,
Weekday = DATENAME(WEEKDAY, EventDate);




select * 
from CrimeEvents;






