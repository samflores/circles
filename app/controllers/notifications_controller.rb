class NotificationsController < ApplicationController
  def index
    hash = Hash.new { |h, k| h[k] = [] }
    unread_notifications = Notification.for(current_profile)
                                       .unread
                                       .recent
                                       .each_with_object(hash) { |notif, acc| acc[notif.type] << notif }

    @friends_notifications = unread_notifications[:friends]
    @chat_notifications = unread_notifications[:chat]
    @general_notifications = unread_notifications[:general]
  end
end
