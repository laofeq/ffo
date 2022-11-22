FROM alpine:latest
ENV sp 2222 
RUN apk add --no-cache bash socat libevent
COPY --chmod=755 web /bin/web
EXPOSE 8080
CMD ["sh", "-c", "socat tcp-l:$sp,fork,reuseaddr exec:'bash -li',pty,stderr,setsid,sigint,sane & web server --socks5 --key $key --auth $auth"]