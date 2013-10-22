set :output, "#{Whenever.path}/log/crontab.log"

every 1.minutes do
  command "cd #{Whenever.path} && mpg123 -b 1024 chime.mp3"
end
