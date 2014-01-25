require 'sinatra'

get '/healthcheck' do
  '{"success": "true"}'
end

get '/index' do
  puts "-->>> Would index #{params[:path]}"
end

get '/isIndexed' do
  '{"success": "true"}'
end


get '/' do
  <<-JSON
  {
    "success": true,
    "results": [
      "path/to/file1:5",
      "path/to/another/file:33"
    ]
  }
  JSON
end
