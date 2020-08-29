#!/usr/bin/env ruby
require 'twitter'
require 'literate_randomizer'

def ruby_bot
    #Connecting to Twitter App
    client = Twitter::REST::Client.new do |config|
        config.consumer_key = ""
        config.consumer_secret = ""
        config.access_token = ""
        config.access_token_secret = ""
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
