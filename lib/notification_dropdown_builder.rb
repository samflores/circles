# frozen_string_literal: true

class NotificationDropdownBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Context
  include Turbo::FramesHelper

  ICONS = {
    friends: 'user-alt-4',
    chat: 'speech-comments',
    general: 'notification'
  }.freeze

  MORE_TEXT = {
    friends: 'Friend Requests',
    chat: 'Messages',
    general: 'Notifications'
  }.freeze

  def initialize(template, type:, item_partial: nil, items: [])
    @template = template
    @type = type
    @items = items
    @item_partial = item_partial
  end

  def view_more(text = nil, path:)
    @view_more = if block_given?
                   @template.capture { yield(@type, text, path) }
                 else
                   build_view_more(@type, text, path)
                 end
    nil
  end

  def icon(type: @type, icon: ICONS[@type])
    @icon = if block_given?
              @template.capture { yield(@type, ICONS[@type]) }
            else
              build_icon(type, icon)
            end
    nil
  end

  def build
    build_trigger
    build_heading
    build_items
    build_footer
    dd_builder.build
  end

  private

  def dd_builder
    @dd_builder ||= DropdownBuilder.new(
      @template,
      container_tag: :li,
      items_tag: nil,
      alignment: :end,
      classname: "nav-item dropdown-#{@type}"
    )
  end

  def notifications?
    @notifications ||= @items.size.positive?
  end

  def build_trigger
    dd_builder.trigger(enabled: notifications?) do
      trigger_content
    end
  end

  def trigger_content
    @template.concat(icon_content)
    @template.concat(build_badge)
  end

  def icon_content
    @icon || build_icon(@type, ICONS[@type])
  end

  def build_heading
    dd_builder.item do
      @template.render(
        'shared/header_dropdown_heading',
        title: @type.to_s.titleize,
        actions: [
          { label: 'Settings', url: '#' },
          { label: 'Mark all as Read', url: '#' }
        ]
      )
    end
  end

  def build_items
    dd_builder.item do
      content_tag(:div, class: 'item-body') do
        turbo_frame_tag "#{@type}_notifications" do
          if notifications?
            @items.each do |item|
              concat(
                turbo_frame_tag(item) do
                  concat(@template.render(partial: item_partial, locals: { notification: item }))
                end
              )
            end
          else
            concat(content_tag(:div, class: 'item-empty') { "No #{MORE_TEXT[@type]}" })
          end
        end
      end
    end
  end

  def item_partial
    @item_partial || "notifications/#{@type}"
  end

  def build_footer
    dd_builder.item do
      content_tag(:div, class: 'item-footer') { view_more_content }
    end
  end

  def view_more_content
    @view_more || build_view_more(@type, MORE_TEXT[@type])
  end

  def build_badge
    turbo_frame_tag "#{@type}_notifications_count" do
      if notifications?
        content_tag(:span, class: 'notify-count') do
          @items.size > 9 ? '9+' : @items.size.to_s
        end
      end
    end
  end

  def build_view_more(type, text, path = '#')
    link_to("View All #{text}", path, class: "view-btn #{type}")
  end

  def build_icon(type, icon_class)
    content_tag(:i, '', class: "icofont-#{icon_class} #{type}")
  end
end
