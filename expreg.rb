def account_number?(string)
	/\d{4}-\d{3}-\d{3}/.match(string) != nil ? true : false
end

def return_account_number(string)
	re = /\d{4}-\d{3}-\d{3}/
	account_number?(string) ? account_number = string[re] : account_number
end

def return_more_than_one_account_number(string)
	re = /\d{4}-\d{3}-\d{3}/
	account_number?(string) ? account_number = string.scan(re) : account_number = []
end

def replace_account_number(string)
	account_number?(string) ? string.gsub(/\d{4}\-\d{3}/, "XXXX-XXX") : "La cadena no contiene un número de cuenta."
	 # if account_number?(string) 
	 # 	string.gsub /\d{4}\-\d{3}/, "XXXX-XXX"
	 # else 
	 # 	"La cadena no contiene un número de cuenta."
	 # end
end

def format_account_number(string)
	(/\d{10}/ =~ string) ? string.sub(/(\d{4})(\d{3})(\d{3})/, '\1-\2-\3') : string
end

string_con_un_numero_de_cuenta = "El Cliente con el número de cuenta 1234-123-123 se encuentra en proceso de revisión de sus documentos"
string_con_un_numero_de_cuenta_no_valido = "El Cliente con el número de cuenta 4-12-12 se encuentra en proceso de revisión de sus documentos"
string_con_mas_de_un_numero_de_cuenta = "Hay que transferir los fondos de la cuenta 1234-123-123 a la cuenta 4321-321-311"

# Driver code.
p account_number?(string_con_un_numero_de_cuenta) == true
p account_number?(string_con_un_numero_de_cuenta_no_valido) == false
p account_number?(string_con_mas_de_un_numero_de_cuenta) == true

p return_account_number(string_con_un_numero_de_cuenta) == "1234-123-123"
p return_account_number(string_con_un_numero_de_cuenta_no_valido) == nil
p return_account_number(string_con_mas_de_un_numero_de_cuenta) == "1234-123-123"

p return_more_than_one_account_number(string_con_un_numero_de_cuenta) == ["1234-123-123"]
p return_more_than_one_account_number(string_con_un_numero_de_cuenta_no_valido) == []
p return_more_than_one_account_number(string_con_mas_de_un_numero_de_cuenta) == ["1234-123-123", "4321-321-311"]

p replace_account_number(string_con_un_numero_de_cuenta) == "El Cliente con el número de cuenta XXXX-XXX-123 se encuentra en proceso de revisión de sus documentos"
p replace_account_number(string_con_un_numero_de_cuenta_no_valido) == "La cadena no contiene un número de cuenta."
p replace_account_number(string_con_mas_de_un_numero_de_cuenta) == "Hay que transferir los fondos de la cuenta XXXX-XXX-123 a la cuenta XXXX-XXX-311"

p format_account_number("8743658922") == "8743-658-922"
p format_account_number("984354") == "984354"