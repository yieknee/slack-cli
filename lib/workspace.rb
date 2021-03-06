require_relative 'user'
require_relative 'channel'
require 'colorize'

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
      if channel_obj.name == channel || channel_obj.slack_id.downcase == channel || channel_obj.slack_id == channel
        @selected = channel_obj
        return channel_obj 
      end
    end
    return "Channel not found!"
  end

  def select_user(user)
    @users.each do |user_obj|
      if user_obj.name == user || user_obj.slack_id.downcase == user || user_obj.slack_id == user
        @selected = user_obj
        return user_obj 
      end
    end
    return "User not found!"
  end

  def show_details
    if @selected.class ==  User || @selected.class == Channel 
      return @selected
    else
      return nil
    end
  end

  def send_message(message)
   if @selected.class ==  User || @selected.class ==  Channel
      response = @selected.send_message(message: message, send_to: @selected.slack_id)
      puts "Message successfully sent to #{@selected.name}".colorize(:magenta).bold
   else
      puts "Can not send message! Message recipient is invalid!".colorize(:red).bold
   end
   return response
  end
end
