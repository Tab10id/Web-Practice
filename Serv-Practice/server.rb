require 'socket'

server = TCPServer.new(9999)

SERVER_ROOT = "C:\\Users\\tablo\\RubymineProjects\\Web-Practice\\HTML-Practice"

def content_type(full_path)
  _name, extension = full_path.split('.')
  case extension
  when 'html'
    'text/html'
  when 'css'
    'text/css'
  when 'js'
    'text/javascript'
  else
    'application/octet-stream'
  end
end

while (session = server.accept)
  request = session.gets

  next unless request

  puts request
  method, full_path = request.split(" ")
  file_path = "#{SERVER_ROOT}#{full_path}"
  body =
      if File.file?(file_path)
        File.read(file_path)
      else
        '404'
      end
  status =
      if File.file?(file_path)
        '200'
      else
        '404'
      end
  response = "HTTP/1.1 #{status}\r\n"
  response << "Content-Type: #{content_type(file_path)}\r\n"
  response << "\r\n"
  response << body
  session.print response
  session.close
end

#http://127.0.0.1:9999/index.html