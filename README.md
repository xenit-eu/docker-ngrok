# Docker Image for Ngrok

[![chat](https://badges.gitter.im/xeniteu/docker.svg)](https://gitter.im/xeniteu/docker)

> ngrok exposes local networked services behinds NATs and firewalls to the
public internet over a secure tunnel. Share local websites, build/test
webhook consumers and self-host personal services.

In this repo, [ngrok](https://ngrok.com/) v2 is packaged as a Docker Image.

## Supported tags and respective `Dockerfile` links

* [`latest`](https://github.com/xenit-eu/docker-ngrok/blob/master/src/main/Dockerfile)

## Usage

You can expose a service running in a docker container, listening on port `8080` with:

```
$ docker run --rm -it ngrok http <container-ip>:8080
```

The ngrok client exposes a [REST API](https://ngrok.com/docs#client-api) to manage the client and
is exposed on port `4040` inside the container.

### Command-line arguments

To see command-line options, run `docker run --rm xenit/ngrok ngrok --help`.

### Environment variables

If you use the default `CMD`, without providing any command, there are a few environment variables that can be used
instead of the command line arguments.

Note that those have different defaults than the native ngrok binary, because these are slightly tuned to run ngrok
from within a docker container.

* `NGROK_PROTOCOL` - tunnel protocol name: `http`, `tcp`, `tls` (default: `http`)
* `NGROK_REGION` - ngrok server region - `us`, `eu`, `au`, `ap`, `sa`, `jp`, `in` (default: `us`)
* `NGROK_BINDTLS` - listen for `http`, `https` or `both` (default: `both`)
* `NGROK_FORWARD` - [host:]port to expose (defaults to `80` for `http` protocol)
* `NGROK_LOG` - either the path to the log file, `stdout`, `stderr` or `false` (default: `stdout`)
* `NGROK_LOG_FORMAT` - log record format `term`, `logfmt`, `json` (default: `term`)
* `NGROK_LOG_LEVEL` - logging level `debug`, `info`, `warn` (default: `info`)

Note that as if you provide your own command, the environment variables won't be used. For more advanced use cases,
you can use the command-line options directly.

## Feedback

Report issues/questions/feature requests on [GitHub Issues][issues]

## License

Apache 2.0

[issues]:           https://github.com/xenit-eu/docker-ngrok/issues

[ngrok]:            https://ngrok.com/
[ngrok-api]:        https://ngrok.com/docs#client-api

