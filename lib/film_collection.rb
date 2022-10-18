class FilmCollection
  attr_reader :all_films

  def self.from_list(url)
    # Парсинг страницы
    doc = Nokogiri::HTML(open(url))

    tags = doc.xpath('//li[contains(@class, "movie")]')

    # Сохранение фильмов в массив
    all_films =
      tags.map do |tag|
        film_title = tag.xpath('h2/a[contains(@href, "/movies/")]').text
        producer = tag.xpath('ul/li/a[contains(@href, "?tags=director")]').text
        year = tag.xpath('ul/li/a[contains(@href, "?tags=year")]').text

        Film.new(film_title, producer.split('+').map(&:capitalize).join(' '), year)
      end
  end

  def to_s
    all_films.join("\n")
  end
end
