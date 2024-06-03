class NotificationsController < ApplicationController
  def index
    @friends_notifications = [1]
    @chat_notifications = [1, 2]
  end
end
