#!/usr/bin/env ruby
require 'rubygems'
require "bundler/setup"
require 'open-uri'
require 'json'
require 'parseconfig'

# read config file 
config_file = ARGV[0]
config_file ||= 'config/yt2gm.conf'
conf = ParseConfig.new(config_file)
last_check = conf.params['last_check']
music_path = conf.params['music_path'] || '.'

# write current time to config
conf.params['last_check'] = Time.now.utc.to_s
file = open(conf.config_file, 'w')
conf.write(file)
file.close()

#debug
#last_check = Time.parse("UTC 2012-05-07 13:54:32").utc.to_s

def get_favorites(youtube_acc)
  json_object = JSON.parse(open("http://gdata.youtube.com/feeds/api/users/#{youtube_acc}/favorites?alt=json&v=2").read)
  json_object['feed']['entry']
end

def download(link)
  puts 'Grabbing: '+ link
  `cd #{music_path} && youtube-dl -o "%(title)s.%(ext)s" -q --extract-audio --audio-format "mp3" "#{link}"` 
end

def get_download_link(item)
  item["link"].each {|link| return link['href'] if link['rel'] == 'alternate' }
end

def new_item?(item, last_check)
  Time.parse(last_check) < Time.parse(item['published']['$t'])
end

unless last_check.nil? then
  puts 'Last Check Time: '+ last_check
  get_favorites(conf.params['youtube_acc']).each do |item|
    if new_item? item, last_check
      puts item['title']['$t'] + 'added at ' + Time.parse(item['published']['$t']).to_s
      download get_download_link(item)
    end
  end
end


