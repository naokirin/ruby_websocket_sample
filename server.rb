require 'faye/websocket'

App = lambda do |env|
  if Faye::WebSocket.websocket?(env)
    puts 'start websocket'
    ws = Faye::WebSocket.new(env)

    ws.on :open do |event|
      puts 'Websocket opened'
    end

    ws.on :message do |event|
      ws.send "#{event.data}"
    end

    ws.on :close do |event|
      puts 'WebSocket closed'
      ws = nil
    end

    ws.rack_response
  else
    puts 'start http'
    [200, {'Content-Type' => 'text/plain'}, ['Hello']]
  end
end
