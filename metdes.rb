def format_account_number(string)
	(/\d{10}/ =~ string) ? string.sub(/(\d{4})(\d{3})(\d{3})/, '\1-\2-\3') : string
end

def format_account_number!(string)
	(/\d{10}/ =~ string) ? string.sub!(/(\d{4})(\d{3})(\d{3})/, '\1-\2-\3') : string
end

string = '3421974376'
p format_account_number(string) == "3421-974-376"
p string == '3421974376'
p format_account_number!(string) == "3421-974-376"
p string == "3421-974-376"