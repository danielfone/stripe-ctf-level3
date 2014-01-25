require 'sinatra'

configure do
  set :index_path, 'test/data/input/'
end


@path = 

get '/healthcheck' do
  '{"success": "true"}'
end

get '/index' do
  @path = params[:path]
end

get '/isIndexed' do
  '{"success": "true"}'
end


get '/' do
  q = params[:q]
  return '{"success": "false"}' if q.nil?

  cmd = %Q[cd #{settings.index_path}; grep '#{params[:q]}' -Rn . | cut -d ':' -f 1,2 | cut -d '/' -f 2-]
  results = `#{cmd}`.strip
  rjson = results.split("\n")
  <<-JSON
  {
    "success": true,
    "results": #{rjson.inspect}
  }
  JSON
end
