#!/usr/bin/env ruby
require 'twitter'
require 'literate_randomizer'

def ruby_bot
    #Connecting to Twitter App
    client = Twitter::REST::Client.new do |config|
        config.consumer_key = "4BUjRhKHrusqWmU5EX8p1M4HA"
        config.consumer_secret = "J5xdmzL6oiTpFBSyAGmiMbNsCi5OUK5hC1VDFtEWDswS7fp3zH"
        config.access_token = "1275089697438674945-VNMzuAHBnuBH8h9pwI4S5s500j7EcI"
        config.access_token_secret = "5x7irfuAM7lgcfP9DKRE0nPtapvt0ybKV3voRs4J5N3iI"
    end

    #tweets random sentence with random hashtag when app is called, at the :00 and :30 minutes marks
        if Time.now.min == 0 || Time.now.min == 30
            tweet = LiterateRandomizer.sentence + " #" + LiterateRandomizer.word
            client.update(tweet)
            puts "\nNew tweet at #{Time.now.strftime('%H:%M')}: '#{tweet}'" #print tweet time and content to terminal
        end
end

while true
    ruby_bot
end