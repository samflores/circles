# frozen_string_literal: true

class ToastBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Context

  def initialize(template, title: 'Alert', icon: 'warning', message: nil, closable: true)
    @template = template
    @title = title
    @message = message
    @closable = closable
    @icon = icon
  end

  def title(text = nil, &)
    @title = if block_given?
               @template.capture(&)
             else
               text.presence || @title
             end
    nil
  end

  def message(message = nil, &)
    @message = if block_given?
                 @template.capture(&)
               else
                 message.presence || @message
               end
    nil
  end

  def build
    classname = "toast show #{@title.parameterize.dasherize}-toast"
    content_tag(:div, class: classname, aria: { live: 'assertive', atomic: true }) do
      concat(build_header)
      concat(build_body)
    end
  end

  private

  def build_header
    content_tag(:div, class: 'toast-header') do
      concat(build_title)
      concat(build_icon)
      concat(build_close_button) if @closable
    end
  end

  def build_title
    content_tag(:strong, class: 'me-auto') do
      @title
    end
  end

  def build_icon
    content_tag(:small) do
      concat(content_tag(:i, '', class: "icofont-#{@icon}"))
    end
  end

  def build_close_button
    content_tag(:button, '', class: 'btn-close', data: { 'bs-dismiss': 'toast' }, aria: { label: 'Close' })
  end

  def build_body
    content_tag(:div, class: 'toast-body') do
      @message
    end
  end
end
