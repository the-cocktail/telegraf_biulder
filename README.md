=Telegraf custom builder

Dockerfile to build a image which compiles a custom version of influxdata/telegraf

== Build Docker Image:

```
docker build -t <name> .
```

If you need to merge other PR different than #1407 and #1526 modify entrypoint.sh script accordingly

== Usage

```
docker run --rm -v $PWD:/tmp the-cocktail/telegraf_custom_builder
```

The entry point script should obtain latest telegraf code, and try to merge selected PRs against it. If it succeded then it will try to make use of telegraf build script to leave in /tmp a custom version of telegraf, with their corresponding .deb, .rpm and .tar.gz version for linux 64

