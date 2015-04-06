FROM gliderlabs/alpine:3.1

RUN apk --update add ca-certificates ruby-dev wget supervisor build-base ffmpeg youtube-dl

RUN gem install bundler --no-ri --no-rdoc

RUN wget https://github.com/hSATAC/youtube-favorite-to-google-music/archive/master.zip && unzip master.zip && rm master.zip

RUN cd youtube-favorite-to-google-music-master && bundle

RUN mkdir /appdata

RUN cp /youtube-favorite-to-google-music/config/yt2gm.conf.example /appdata/yt2gm.conf

VOLUME /appdata

ADD yt2gm.sh /etc/periodic/15min/yt2gm.sh

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
