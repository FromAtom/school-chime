# -*- coding: utf-8 -*-
set :job_template, "/bin/zsh -l -c ':job'"
env :PATH, ENV['PATH']
set :output, "#{Whenever.path}/log/crontab.log"
set :chime, "cd #{Whenever.path} && bundle exec ruby school-chime.rb"

#テスト用
# every 1.minutes do
#   command "#{chime}"
# end

#1限始鈴
every 1.day, :at => '8:50 am' do
  command "#{chime}"
end

#1限終鈴
every 1.day, :at => '10:20 am' do
  command "#{chime}"
end

#---

#2限始鈴
every 1.day, :at => '10:30 am' do
  command "#{chime}"
end

#2限終鈴
every 1.day, :at => '11:59 am' do
  command "#{chime}"
end

#---

#3限始鈴
every 1.day, :at => '12:49 pm' do
  command "#{chime}"
end

#3限終鈴
every 1.day, :at => '2:20 pm' do
  command "#{chime}"
end

#---

#4限始鈴
every 1.day, :at => '2:30 pm' do
  command "#{chime}"
end

#4限終鈴
every 1.day, :at => '4:00 pm' do
  command "#{chime}"
end

#---

#5限始鈴
every 1.day, :at => '4:10 pm' do
  command "#{chime}"
end

#5限終鈴
every 1.day, :at => '5:40 pm' do
  command "#{chime}"
end

#---

#6限始鈴
every 1.day, :at => '5:50 pm' do
  command "#{chime}"
end

#6限終鈴
every 1.day, :at => '7:20 pm' do
  command "#{chime}"
end

#---

#7限始鈴
#every 1.day, :at => '7:30 pm' do
#  command "#{chime}"
#end
#
##7限終鈴
#every 1.day, :at => '9:00 pm' do
#  command "#{chime}"
#end

#---

#終電注意
every 1.day, :at => '10:55 pm' do
  command "#{chime}"
end

#終電注意2
#every 1.day, :at => '11:00 pm' do
#  command "#{chime}"
#end

#---
