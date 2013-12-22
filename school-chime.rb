# -*- coding: utf-8 -*-
#!/usr/bin/env ruby

require "rbconfig"
require "holiday_japan"

class Toller
  def initialize(chime_path, closing_chime_path)
    @chime_sound = chime_path
    @closing_sound = closing_chime_path
  end

  def toll
    #時間帯によって鳴らすmp3を変える
    chose_toll = choose_toll()

    #OSによって使うコマンドを変える
    chose_hammer = choose_hammer()

    if holiday?
      puts "Thanks GOD! It's holiday!!!"
    else
      `#{chose_hammer} #{chose_toll}`
      puts "played '#{chose_toll}' [#{Time.now}]"
    end
  end

  def choose_hammer
    if RUBY_PLATFORM.downcase =~ /linux/
      return "mpg123 -b 1024 -q"
    end

    if RUBY_PLATFORM.downcase =~ /darwin/
      return "afplay"
    end
  end

  def choose_toll
    #終業時間以降は蛍の光を鳴らす
    if closing?
      return @closing_sound
    else
      return @chime_sound
    end
  end

  def holiday?
    today = Date.today
    wday = today.wday
    return wday == 0 || wday == 6 || HolidayJapan.check(today)
  end

  def closing?
    if Time.now.hour >= 22
      return TRUE
    else
      return FALSE
    end
  end
end

toller = Toller.new("sounds/chime.mp3", "sounds/hotaru.mp3")
toller.toll
