-- Trigger: gerarmd5 on public.usuarios

-- DROP TRIGGER gerarmd5 ON public.usuarios;

CREATE TRIGGER gerarmd5
  BEFORE INSERT OR UPDATE
  ON public.usuarios
  FOR EACH ROW
  EXECUTE PROCEDURE public.convert_pass_md5();


-- Function: public.convert_pass_md5()

-- DROP FUNCTION public.convert_pass_md5();

CREATE OR REPLACE FUNCTION public.convert_pass_md5()
  RETURNS trigger AS
$BODY$
BEGIN
  new.senha := MD5(new.senha);
  return new;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.convert_pass_md5()
  OWNER TO postgres;
