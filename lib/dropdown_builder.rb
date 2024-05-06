# frozen_string_literal: true

class DropdownBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Context

  TRIGGER_OPTIONS = {
    class: 'dropdown-toggle',
    data: { 'bs-toggle': 'dropdown' },
    'aria-expanded' => 'false'
  }.freeze

  def initialize(template, container_tag: :div, items_tag: :div, trigger_tag: :button, alignment: '', classname: nil)
    @template = template
    @items_tag = items_tag
    @container_tag = container_tag
    @trigger_tag = trigger_tag
    @alignment = alignment
    @classname = classname
    @items = []
  end

  def trigger(text = nil, enabled: true, &)
    @trigger_enabled = enabled
    @trigger_content = if block_given?
                         @template.capture(&)
                       else
                         text.presence
                       end
    nil
  end

  def item(name = nil, url = '#')
    @items << if block_given?
                @template.capture { yield(name, url) }
              else
                build_item(name, url)
              end
    nil
  end

  def build
    content_tag @container_tag, class: "dropdown #{@classname}" do
      concat(build_trigger)
      concat(build_items)
    end
  end

  private

  def trigger_content
    @trigger_content || '...'
  end

  def build_trigger
    if @trigger_tag == :a
      link_to(trigger_content, '#', TRIGGER_OPTIONS.merge({ role: 'button', enabled: @trigger_enabled }))
    else
      content_tag(@trigger_tag, TRIGGER_OPTIONS.merge({ type: 'button', enabled: @trigger_enabled })) do
        concat(trigger_content)
      end
    end
  end

  def build_items
    alignment = @alignment.blank? ? @alignment : "dropdown-menu-#{@alignment}"
    content_tag(@items_tag == :li ? :ul : @items_tag || :div, class: "dropdown-menu #{alignment}") do
      @items.each { |item| concat(item) }
    end
  end

  def build_item(name, url)
    if @items_tag
      content_tag(@items_tag, class: 'dropdown-item') do
        concat(link_to(name, url))
      end
    else
      link_to(name, url, class: 'dropdown-item')
    end
  end
end
