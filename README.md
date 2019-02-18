# Ruby websocket sample

Rubyで`faye-websocket-ruby`を利用したWebsocketのサーバーとクライアントの簡単な実装

## 実行方法

```
$ bundle
$ bundle exec puma config.ru

# 別のターミナル上で
$ bundle exec ruby client.rb
```

`client.rb` を実行したターミナルで、サーバーからのhello通知が表示される

