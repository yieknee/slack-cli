require_relative 'user'
require_relative 'channel'

class Workspace
  attr_reader :users, :channels
  attr_accessor :selected
  
  def initialize

    @users = User.list_all

    @channels = Channel.list_all

    @selected = selected
  end

  def select_channel(channel)
    @channels.each do |channel_obj|
      if channel_obj.name == channel || channel_obj.slack_id.downcase == channel
        @selected = channel_obj
        return channel_obj 
      end
    end
    return "Channel not found!"
  end

  def select_user(user)
    @users.each do |user_obj|
      if user_obj.name == user || user_obj.slack_id.downcase == user
        @selected = user_obj
        return user_obj 
      end
    end
    return "User not found!"
  end

  def show_details
    if @selected != nil
      return @selected
    else
      return nil
    end
  end

  def send_message
  end
end

