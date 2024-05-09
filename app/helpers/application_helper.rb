# frozen_string_literal: true

module ApplicationHelper
  def dropdown(container_tag: :div, items_tag: :div, trigger_tag: :button, alignment: '', classname: '')
    builder = DropdownBuilder.new(self, container_tag:, items_tag:, trigger_tag:, alignment:, classname:)
    yield(builder) if block_given?
    builder.build
  end

  def avatar_for(profile)
    image_tag("https://api.dicebear.com/7.x/micah/jpg?seed=#{profile.full_name.underscore}")
  end

  def toast(title: 'Alert', message: nil, closable: true)
    builder = ToastBuilder.new(self, title:, message:, closable:)
    yield(builder) if block_given?
    builder.build
  end
end
