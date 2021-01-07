DELIMITER $$
CREATE TRIGGER zmiana_ceny
BEFORE INSERT ON ksiazki for each row 
BEGIN if new.cena>150 then set new.cena=150;
END if;
END $$