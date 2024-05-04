# Use a minimal base image
FROM alpine:edge

ARG USER=browser

# Set environment variables
ENV DISPLAY=:0 \
    VNC_RESOLUTION=1024x768 \
    STARTING_WEBSITE_URL=https://www.google.com

# Install necessary packages and setup noVNC
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache \
    xvfb \
    x11vnc \
    tini \
    supervisor \
    firefox \
    font-terminus \
    font-inconsolata \
    font-dejavu \
    font-noto \
    font-noto-cjk \
    font-awesome \
    font-noto-extra \
    font-vollkorn \
    font-misc-cyrillic \
    font-mutt-misc \
    font-screen-cyrillic \
    font-winitzki-cyrillic \
    font-cronyx-cyrillic \
    font-noto-thai \
    font-noto-tibetan \
    font-ipa \
    font-sony-misc \
    font-jis-misc \
    msttcorefonts-installer \
    xdotool

# Copy configuration files
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
COPY start_firefox.sh /start_firefox.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh /start_firefox.sh

RUN adduser -D $USER

# Expose VNC port
EXPOSE 5901

USER $USER
WORKDIR /home/$USER

# Set tini as the entrypoint and the custom script as the command
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/entrypoint.sh"]
