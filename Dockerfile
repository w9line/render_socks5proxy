FROM gogost/gost:latest
EXPOSE 10000
CMD ["-L", "socks5+ws://user:pass@:10000"]
