# frozen_string_literal: true

module ApplicationHelper
  def dropdown(container_tag: :div, items_tag: :div, trigger_tag: :button, alignment: '', classname: '')
    builder = DropdownBuilder.new(self, container_tag:, items_tag:, trigger_tag:, alignment:, classname:)
    yield(builder)
    builder.build
  end
end
