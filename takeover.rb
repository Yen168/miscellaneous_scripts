require 'open-uri'
require 'nokogiri'
require 'json'

URL = "https://itp.nyu.edu/registration/CourseListing.2015.php?semester=Spring&year=2016&submit=Go"

doc = Nokogiri::HTML(open(URL))

# Class Info: Tier
h2 = doc.css('h2[style="text-align:left;"]')
# Class Info: Title
h3 = doc.css('h3')
# Class Info: Desc
tr = doc.css('tr[desc="desc"]')

content = [h3,tr].map {|x| x.reduce([]) {|sum, a|sum << a.text}}
content = content[0].zip(content[1])

output = content.map {|x| JSON.generate({class_title:x[0],class_desc:x[1]})}





