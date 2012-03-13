#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://tracker.erasme.org/feed-7.php?feed_type=rss2"))

doc.xpath('//item/title').each do |t|
    puts t.text
end

