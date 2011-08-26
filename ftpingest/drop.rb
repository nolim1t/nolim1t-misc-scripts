#!/usr/bin/env ruby
server = ENV['ftpserver']
user = ENV['user']
pass = ENV['pass']
file = ENV['file']

require 'net/ftp'
require 'guid'

if server != nil then
    ftp = Net::FTP.new(server)
    ftp.login(user, pass)
    thefilename = "#{Guid.new.to_s}.mp4"
    puts "Sending #{file} as #{thefilename}"
    ftp.putbinaryfile(file,thefilename)
    ftp.close
else
  puts "Make sure you export the following variables - ftpserver, user, pass, and file"
end
