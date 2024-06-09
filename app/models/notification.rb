class Notification < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :profile

  scope :unread, -> { where(viewed: false) }
  scope :recent, -> { order(created_at: :desc) }
  scope :for, ->(profile_id) { profile_id ? where(profile_id:) : nil }
  scope :with_type, ->(item) { item ? where(item_type: item.class.name) : nil }

  after_create_commit do
    broadcast_prepend_to(
      profile,
      :broadcast,
      target: "#{type}_notifications",
      partial: 'notifications/notification',
      locals: { type: }
    )
  end

  after_destroy_commit do
    broadcast_remove_to(
      profile,
      :broadcast
    )
  end

  after_commit do
    count = Notification.unread.with_type(item).for(profile).count
    broadcast_replace_to(
      profile,
      :broadcast,
      target: "#{type}_notifications_count",
      partial: 'notifications/count',
      locals: { type:, count: }
    )
  end

  def type
    case item
    when Status then :general
    when Friendship then :friends
      # when message then :chat
    end
  end
end
