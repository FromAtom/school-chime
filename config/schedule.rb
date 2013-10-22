set :output, "#{Whenever.path}/log/crontab.log"

every 10.minutes do
  command "cd #{Whenever.path} && afplay chime.mp3"
end
