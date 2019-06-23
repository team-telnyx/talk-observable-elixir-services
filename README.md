Talk: Observable Elixir Services
================================

## Demos

1. Services in the dark
2. Collect logs: API, service calls, custom logs, remove logs for `/health`
3. Propagate request ID
4. Propagate request ID: across process boundary

## Cheatsheet (fish shell)

Generate simple Phoenix service with HTTP API:

```
mix archive.install hex phx_new 1.4.8
mix phx.new demo \
  --umbrella --no-html --no-webpack --no-ecto
```

Test locally:
```
forego run iex -S mix phx.server
http -v :4000/calls from=1111 to=2222
http -v :4000/calls/ea2c6243-6858-4d5d-8287-4e39d6b5141d/actions/play \
  url="http://example.com/hello.mp3"
```

Run release: 
```
env MIX_ENV=prod mix release
forego run _build/prod/rel/demo/bin/demo foreground
```

Build and deploy services to k8s:
```
./services/build.sh
./services/deploy.sh
```

Test on k8s:
```
http -v :30000/calls from=1111 to=2222
http -v :30000/calls/ea2c6243-6858-4d5d-8287-4e39d6b5141d/actions/play \
  url="http://example.com/hello.mp3"
```

Tail logs with Stern:
```
stern call-control
stern 'call-control|tel-switch'
```

Install Prometheus Operator:
```
helm init
helm upgrade --install prom \
  -f prometheus/operator.yaml \
  stable/prometheus-operator
```

Install Loki:
```
helm upgrade --install loki loki/loki-stack
```

Port-forward Grafana:
```
kubectl port-forward service/prom-grafana 3000:80
```

Generate load with Fortio:
```
fortio load -qps 2 -c 2 -t 0 \
  -content-type 'application/json' -payload '{"from": "1111", "to": "2222"}' \
  localhost:30000/calls

fortio load -qps 1 -c 2 -t 0 \
  -content-type 'application/json' -payload '{"url": "http://example.com/hello.mp3"}' \
  localhost:30000/calls/ea2c6243-6858-4d5d-8287-4e39d6b5141d/actions/play
```
