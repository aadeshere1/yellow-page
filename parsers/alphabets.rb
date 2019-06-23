nokogiri = Nokogiri::HTML(content)

categories = nokogiri.css('.cats')
SITE = "https://www.yellowpagesnepal.com/"

categories.each do |category|
	link = category.xpath('.//a/@href').text
	url = "#{SITE}#{link}"
	name = category.text
	item_count = name.scan(/\[([0-9]*)\]/)
	puts url
	puts name
	puts item_count
	pages << {
		url: url,
		page_type: 'categories',
		fetch_type: 'browser',
		force_fetch: true,
		vars: {
			url: url,
			category_count: item_count,
			name: name
		}
	}
end

alphabets = nokogiri.xpath('//div[@class="cat-content"]//li')
alphabets.each do |alphabet|
	link = alphabet.xpath('.//a/@href').text
	url = "#{SITE}#{link}"
	pages << {
		url: url,
		page_type: 'alphabets',
		force_fetch: true
	}
end
