require 'nokogiri'
require 'open-uri'
require_relative 'lib/film'
require_relative 'lib/film_collection'

puts "Программа «Фильм на вечер»"
puts

# считывание информации
# в один массив all_films

all_films = FilmCollection.from_list("https://www.icheckmovies.com/lists/imdbs+top+250/")

# обработка
# массив со всеми режиссерами

puts "Все режиссеры:"

all_producers = all_films.map(&:producer).uniq

# вывод режиссеров пользователю на выбор
all_producers.each.with_index(1) { |producer, index| puts "#{index}. #{producer}" }

puts

puts "Фильм какого режиссера вы хотите сегодня посмотреть?"
user_choice = $stdin.gets.to_i
chosen_producer = all_producers[user_choice - 1]

chosen_films = all_films.select { |film| film.producer == chosen_producer }

puts "И сегодня вечером рекомендую посмотреть:"
puts chosen_films.sample
