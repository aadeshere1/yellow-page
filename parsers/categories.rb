nokogiri = Nokogiri::HTML(content)

lists = nokogiri.xpath('//a[@class="category"]')

SITE = "https://www.yellowpagesnepal.com/"

lists.each do |page|
	link = page.xpath('.//@href').text
	url = "#{SITE}#{link}"

	pages << {
		url: url,
		page_type: "listing"
	}
end