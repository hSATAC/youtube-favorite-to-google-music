# Youtube Favorite to Google Music

## Introduction

This is a tool to check your youtube favorite list and grab your recent items, turn them into mp3s so your Google Music Manager could upload them.

The script will get your youtube favorite list through gdata api v2, you could set a cronjob by yourself or using whenever to configure crontab easily.

## Requirements

The video-grabbing and encoding part is base on [youtube-dl](https://github.com/rg3/youtube-dl). And ```ffmpeg``` is required.

```parseconfig``` is required. Install via ```gem install parseconfig```

You'll need to ```gem install whenever``` if you want to set a crontab based on ```config/scheduler/rb```

## Usage

### Run

* ```cp config/yt2gm.conf.sample config/y2tgm.conf``` or other place you like.
* Modify config file, set your youtube account.
* run ```./yt2gm.rb [config_file]```

If you didn't specify the config_file, it will load ```config/yt2gm.conf```

### Setup Crontab

* Modify ```config/scheduler.rb``` based on your path.
* run ```whenever -i``` to update your crontab.

And don't forget to configure your Google Music Manager to watch the directory where mp3 stores.

## Disclaimer

**NOTICE: It's for my own usage now, need more refactoring. But the idea is very simple, you could take a look if you're interested.**