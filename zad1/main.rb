def sort_letters(string)
  string.delete(" ").chars.sort.join # pass to sort if char case matters (&:casecmp)
end

def count_vowels(string)
  string.count('aeiouy')
end

def filter_odd(array)
  array.select(&:odd?)
end

sort_letters('dcba') #=> 'abcd'
sort_letters('zyx') #=> 'xyz'

count_vowels('mmmm') #=> 0
count_vowels('super') #=> 2
count_vowels('super extra') #=> 4

filter_odd([1, 2, 3, 4, 5]) #=> [1, 3, 5]
filter_odd([6, 7, 9, 2, 6, 5]) #=> [7, 9, 5]
