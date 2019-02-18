require 'faye/websocket'
require 'eventmachine'

EM.run do
  ws = Faye::WebSocket::Client.new('ws://0.0.0.0:9292')

  ws.onopen = lambda do |event|
    puts 'Websocket opened.'
  end

  ws.onmessage = lambda do |message|
    puts ">> #{message.data}"
  end

  ws.onclose = lambda do |close|
    puts "Websocket closed: (#{close.code}, #{close.reason})"
    ws = nil
    EM.stop
  end

  ws.onerror = lambda do |error|
    puts "Error occured: #{error.message}"
  end

  ws.send 'hello'
end

