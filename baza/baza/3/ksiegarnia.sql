-- Baza danych: `ksiegarnia` 
-- Będzie ona przetwarzała indormacje o stanie ksiazek , pracownikach i klientach oraz ich formie płatności za ksiazke
CREATE DATABASE IF NOT EXISTS `ksiegarnia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ksiegarnia`;

CREATE TABLE IF NOT EXISTS `klienci` (
  idklienta INT PRIMARY KEY AUTO_INCREMENT,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `miejscowosc` text COLLATE utf8_polish_ci NOT NULL
);
INSERT INTO `klienci` (`imie`, `nazwisko`, `miejscowosc`) VALUES
('Łukasz', 'Lewandowski', 'Poznań'),
('Jan', 'Nowak', 'Katowice'),
('Maciej', 'Wójcik', 'Bydgoszcz'),
('Agnieszka', 'Jankowska', 'Lublin'),
('Tomasz', 'Mazur', 'Jelenia Góra'),
('Michał', 'Zieliński', 'Kraków'),
('Artur', 'Rutkowski', 'Kielce'),
('Mateusz', 'Skorupa', 'Gdańsk'),
('Jerzy', 'Rutkowski', 'Rybnik'),
('Anna', 'Karenina', 'Pułtusk'),
('Alan', 'Janukiewicz', 'Olsztyn');

-- ------------------------------------
CREATE TABLE IF NOT EXISTS `pracownicy` (
  `idpracownika` int(11) NOT NULL AUTO_INCREMENT,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idpracownika`),
  KEY `id` (`idpracownika`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

INSERT INTO `pracownicy` (`idpracownika`, `imie`, `nazwisko`) VALUES
(1, 'Damian', 'Szklarczyk'),
(2, 'Jakub', 'Chełchowski'),
(3, 'Mateusz', 'Kołodzieczyk'),
(4, 'Adam', 'Kalista'),
(5, 'Jan', 'Duda'),
(6, 'Alan', 'Janukiewicz'),
(7, 'Jakub', 'Kłos'),
(8, 'Mateusz', 'Kalista'),
(9, 'Adam', 'Nowak'),
(10, 'January', 'Makłin'),
(11, 'Wilk', 'Zajec');

-- ------------------------------------
CREATE TABLE IF NOT EXISTS `ksiazki` (
  `idksiazki` int(11) NOT NULL AUTO_INCREMENT,
  `imieautora` text COLLATE utf8_polish_ci NOT NULL,
  `nazwiskoautora` text COLLATE utf8_polish_ci NOT NULL,
  `tytul` text COLLATE utf8_polish_ci NOT NULL,
  `cena` float NOT NULL,
  PRIMARY KEY (`idksiazki`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;
INSERT INTO `ksiazki` (`idksiazki`, `imieautora`, `nazwiskoautora`, `tytul`, `cena`) VALUES
(1, 'Jan', 'Michalak', 'Zaawansowane programowanie w PHP', 47.29),
(2, 'Andrzej', 'Krawczyk', 'Windows 8 PL. Zaawansowana administracja systemem', 49.99),
(3, 'Paweł', 'Jakubowski', 'HTML5. Tworzenie witryn', 53.65),
(4, 'Tomasz', 'Kowalski', 'Urządzenia techniki komputerowej', 34.15),
(5, 'Łukasz', 'Pasternak', 'PHP. Tworzenie nowoczesnych stron WWW', 29.99),
(6, 'Robert', 'Martin' , 'Czysty kod. Podręcznik dobrego programisty', 60.00),
(7, 'Andy', 'Hunt','Pragmatyczny programista. Od czeladnika do mistrza',102.00), 
(8, 'Clifford', 'Stein', 'Wprowadzenie do algorytmów',45.00),
(9, 'Robert', 'C. Martin', 'Mistrz czystego kodu.' , 74.00),
(10, 'Jon' ,'Duckett', 'HTML i CSS. Zaprojektuj i zbuduj witrynę WWW', 332.00),
(11, 'Joshua', 'Bloch', 'Java. Efektywne programowanie.', 21.37);

-- ------------------------------------
CREATE TABLE IF NOT EXISTS `platnosci` (
  `idplatnosci` int(11) NOT NULL AUTO_INCREMENT,
  `koszt` int,
  `data zapłaty` datetime,
  `rodzajplatnosci` varchar(20),
  KEY `id` (`idplatnosci`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;


INSERT INTO `platnosci` (`idplatnosci`, `koszt`, `data zapłaty` ,`rodzajplatnosci` ) VALUES
(1, 24, '2020-10-08', 'karta'),
(2, 31, '2020-09-05', 'karta'),
(3, 41, '2020-10-11', 'karta'),
(4, 122, '2020-10-15', 'przy odbiorze'),
(5, 4215, '2020-08-12', 'gotówka'),
(6, 212, '2020-10-20', 'karta'),
(7, 33, '2020-08-14', 'karta'),
(8, 41, '2020-08-19', 'gotówka'),
(9, 55, '2020-11-19', 'hotówka'),
(10,25, '2020-12-28', 'gotówka'),
(11,21.37,'2020-01-06', 'gotówka');
-- ------------------------------------
CREATE TABLE IF NOT EXISTS `zamowienia` (
  `idzamowienia` int(11) NOT NULL AUTO_INCREMENT,
  `idklienta` int(11) NOT NULL,
  `idksiazki` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idzamowienia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

INSERT INTO `zamowienia` (`idzamowienia`, `idklienta`, `idksiazki`, `data`, `status`) VALUES
(1,2,8, '2019-10-08', 'oczekiwanie'),
(2,7,3,'2019-09-05', 'wyslano'),
(3,9,2, '2020-10-11', 'wyslano'),
(4,2,4,'2020-10-15', 'oczekiwanie'),
(5,2,5, '2020-08-12', 'oczekiwanie'),
(6,3,6, '2020-10-20', 'wyslano'),
(7,4,1, '2020-08-14', 'wyslano'),
(8,8,2, '2020-08-19', 'wyslano'),
(9,3,9, '2020-11-19', 'wyslano'),
(10,2,11, '2020-12-28', 'oczekiwanie'),
(11,11,10,'2020-01-06', 'oczekiwanie');
-- ------------------------------------



