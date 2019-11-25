require 'socket'

server = TCPServer.new(9999)

SERVER_ROOT = "/home/user1/myRep/Web-Practice/HTML-Practice"

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
  STATUS =
      if File.file?(file_path)
        '200'
      else
        '404'
      end
  response = "HTTP/1.1 #{STATUS}\r\n"
  response << "Content-Type: text/html\r\n"
  response << "\r\n"
  response << body
  session.print response
  session.close
end

#http://127.0.0.1:9999/index.html