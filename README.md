# Youtube Favorite to Google Music

This is a tool to check your youtube favorite list and grab your recent items, turn them into mp3s so your Google Music Manager could upload them.

The video-grabbing and encoding part is base on [youtube-dl](https://github.com/rg3/youtube-dl). And ffmpeg is required.

The script will get your youtube favorite list through gdata api v2, you could set a cronjob by yourself or using whenever to configure crontab easily.

And don't forget to configure your Google Music Manager to watch the directory where mp3 stores.

**NOTICE: It's for my own usage now, need more refactoring. But the idea is very simple, you could take a look if you're interested.**