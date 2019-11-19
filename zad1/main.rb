#Zadanie 1

#Czesc 1

def sort_letters(string)
	string.chars.sort.join
end

#Czesc 2

def count_vowels(string)
	string.count "aeiouy"
end

#Czesc 3

def filter_odd(array)
	array.select{|x| x.odd?} 
end



