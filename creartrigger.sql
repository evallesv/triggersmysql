CREATE TRIGGER actualizar_garantia
BEFORE INSERT
ON garantia_bo FOR EACH ROW
BEGIN
  DECLARE numGarantia int;
  DECLARE currentid int;   
  SELECT id,  CONVERT(SUBSTRING_INDEX(SUBSTRING_INDEX(numgar, '-', -2), '-', 1), UNSIGNED) + 1 INTO currentid, numGarantia FROM garantia_bo WHERE LENGTH(numgar) > 0 ORDER BY id DESC LIMIT 0, 1;
  SET NEW.numgar = CONCAT( "BDO-", CONVERT(numGarantia, CHAR),"-", DATE_FORMAT(CURDATE(), '%Y') );
END;
