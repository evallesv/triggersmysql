DELIMITER $$

CREATE TRIGGER actualizar_garantia
BEFORE INSERT
ON garantia_bo FOR EACH ROW
BEGIN
  --variable de garantia
  DECLARE numGarantia int;
  DECLARE currentid int;
  --Extraemos el ultimo valor de garantia
  SELECT @currentid = id, @numGarantia = numgar FROM garantia_bo where LEN(numgar) > 0 AND MAX(id)
  --Actualizamos el registro actual
  UPDATE garantia_bo SET numgar = "BCO-" + numGarantia + "2021" WHERE id = @currentid;
END $$

DELIMITER;
