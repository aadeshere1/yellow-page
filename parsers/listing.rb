nokogiri = Nokogiri::HTML(content)

labels = nokogiri.xpath('//div[contains(@class, "labelLeft")]')
data = nokogiri.xpath('//div[contains(@class, "labelRight")]')
total_data = data.count

page = {}

labels.take(total_data).each_with_index do |label, index|
	key = label.text.strip.split(":").first.strip
	value = data[index].text

	page[key] = value
end

page["_collection"] = "page"

outputs << page