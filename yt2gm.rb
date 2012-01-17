#!/usr/bin/env ruby
require 'rubygems'
require 'open-uri'
require 'json'
require 'parseconfig'

# read config file 
config_file = ARGV[0]
config_file ||= 'config/yt2gm.conf'
conf = ParseConfig.new(config_file)
last_check = conf.params['last_check']

# write current time to config
conf.params['last_check'] = Time.now.utc.to_s
file = open(conf.config_file, 'w')
conf.write(file)
file.close()

#debug
#last_check = Time.parse("UTC 2011-12-30 13:54:32").utc.to_s

unless last_check.nil? then

  puts 'Last Check Time: '+ last_check

  json_object = JSON.parse(open("http://gdata.youtube.com/feeds/api/users/#{conf.params['youtube_acc']}/favorites?alt=json&v=2").read)
  for item in json_object['feed']['entry']
    if(Time.parse(last_check) < Time.parse(item['published']['$t'])) then
      puts item['title']['$t'] + 'added at ' + Time.parse(item['published']['$t']).to_s
      for link in item['link']
        if link['rel'] == 'alternate' then
          puts 'Grabbing: '+ link['href']
          `youtube-dl -o "%(title)s.%(ext)s" -q --extract-audio --audio-format "mp3" "#{link['href']}"`
        end
      end
    end
  end
end


