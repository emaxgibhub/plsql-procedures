create or replace FUNCTION fn_get_cap_sentence (
    sentence IN VARCHAR2
) RETURN VARCHAR2 IS

    l_return            VARCHAR2(1000) := '';
    l_space_index       BINARY_INTEGER ;
     l_string_to_go varchar (1000);
    l_temp_str varchar(1000);
BEGIN

    l_string_to_go:= lower(sentence);
    
     
    loop
     l_space_index := instr(l_string_to_go,' ');

     l_temp_str:=substr(l_string_to_go, 1, l_space_index);
     l_return:=  l_return||UPPER(substr(l_temp_str, 1, 1))||substr(l_temp_str,2);
     l_string_to_go:=substr(l_string_to_go, l_space_index+1);
     
     exit when (l_space_index =0 OR l_string_to_go is null);
     end loop;
     
  
    RETURN
    l_return;
END fn_get_cap_sentence;