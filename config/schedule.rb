# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/Users/cat/.config/yt2gm/yt2gm.log"

every 15.minutes do
 command "cd /Users/cat/Dropbox/Music/auto_add_google_music/ && ./yt2gm.rb /Users/cat/.config/yt2gm/yt2gm.conf"
 #runner "MyModel.some_method"
 #rake "some:great:rake:task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
