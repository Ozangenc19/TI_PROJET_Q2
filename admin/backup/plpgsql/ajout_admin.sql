create or replace function ajout_admin(text,text) returns integer
as
'
	-- déclarations
	DECLARE p_login ALIAS FOR $1; -- premier paramètre reçu
	DECLARE p_password ALIAS FOR $2;
	DECLARE id INTEGER;
	DECLARE retour INTEGER;
BEGIN	
	-- select de l''admin portant ce login et password
	SELECT INTO id id_admin FROM admin WHERE login = p_login and password = p_password;
	IF NOT FOUND
	THEN
	  INSERT INTO admin (login, password) VALUES (p_login,p_password);
	  SELECT INTO id id_admin FROM admin WHERE login = p_login and password = p_password;
	  IF NOT FOUND
	  THEN
	    retour = -1; -- échec insertion
	  ELSE
	    retour = 1; -- réussie réussie
	  END IF;
	ELSE
	  retour = 0;
	END IF;
return retour;	
END;	
' language 'plpgsql';