# -*- coding: utf-8 -*-
#!/usr/bin/env ruby

require "rbconfig"

class Toller
  def initialize(chime_path, closing_chime_path)
    @chime_sound = chime_path
    @closing_sound = closing_chime_path
  end

  def toll()
    #時間帯によって鳴らすmp3を変える
    chose_toll = choose_toll()

    #OSによって使うコマンドを変える
    chose_hammer = choose_hammer()

    `#{chose_hammer} #{chose_toll}`
    puts "played '#{chose_toll}' [#{Time.now}]"
  end

  def choose_hammer()
    if RUBY_PLATFORM.downcase =~ /linux/
      return "mpg123 -b 1024 -q"
    end

    if RUBY_PLATFORM.downcase =~ /darwin/
      return "afplay"
    end
  end

  def choose_toll()
    #終業時間以降は蛍の光を鳴らす
    if is_closing?
      return @closing_sound
    else
      return @chime_sound
    end
  end

  def is_closing?()
    if Time.now.hour >= 22
      return TRUE
    else
      return FALSE
    end
  end
end

toller = Toller.new("sounds/chime.mp3", "sounds/hotaru.mp3")
toller.toll()
