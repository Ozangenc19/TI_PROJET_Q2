create or replace function update_client(int, text,text,text,text,text )
RETURNS integer
AS
'
	declare p_id alias for $1;
	declare p_email alias for $2;
	declare p_nom_client alias for $3;
	declare p_prenom_client alias for $4;
	declare p_adresse alias for $5;
	declare p_numero alias for $6;
	
	declare id integer;
	declare retour integer;
begin
	select into id id_client from client where id_client = p_id;
	if found 
	then
		update client
		set nom_client = p_nom_client, 
		prenom_client = p_prenom_client,
		email = p_email,
		adresse = p_adresse,
		numero = p_numero
		where id_client= p_id;
		select into id id_client from client where id_client = p_id;
		if not found
		then	
	    	retour = -1;  --échec de la requête
	  	else
	    	retour = 1;   -- modification ok
	  	end if;
	else
		retour=0;
	end if;
	return retour;
end;
'language 'plpgsql';