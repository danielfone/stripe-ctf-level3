require 'sinatra'

get '/healthcheck' do
  '{"success": "true"}'
end
