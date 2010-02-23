require 'net/http'
require 'uri'

lat = 43.053771
long = -77.577209

url = URI.parse('http://wherein.yahooapis.com/v1/document');
req = Net::HTTP::Post.new(url.path)
req.set_form_data({
  'documentContent' => "<meta name=\"ICBM\" content=\"#{lat}, #{long}\">",
  'documentType' => 'text/html',
  'appid' => 'fPR4YN7V34H6ywhqeSU0scmBtegKO9MQ9.kF42ysDyeJIvZfAQV2zRJH6LUerKRFhYUpyQ--' ,
  'autoDisambiguate' => 'true',
  'outputType' => 'xml'
})
res = Net::HTTP.new(url.host, url.port).start do | http |
  http.request(req)
end

case res
when Net::HTTPSuccess, Net::HTTPRedirection
  print res.body
else
  res.error!
end
