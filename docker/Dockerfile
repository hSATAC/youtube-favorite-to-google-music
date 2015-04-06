FROM gliderlabs/alpine:3.1

RUN apk --update add ca-certificates ruby-dev wget supervisor build-base ffmpeg youtube-dl && rm -rf /var/cache/apk/*

RUN gem install bundler --no-ri --no-rdoc

RUN wget https://github.com/hSATAC/youtube-favorite-to-google-music/archive/master.zip && unzip master.zip && rm master.zip

RUN cd youtube-favorite-to-google-music-master && bundle

RUN mkdir /appdata /music

RUN cp /youtube-favorite-to-google-music-master/config/yt2gm.conf.sample /appdata/yt2gm.conf

VOLUME ["/appdata", "/music"]

ADD yt2gm.sh /etc/periodic/15min/yt2gm

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
