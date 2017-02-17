module ApplicationHelper
  def render_flash
    ActiveSupport::SafeBuffer.new.tap do |output|
      %i(notice success error).each do |message|
        output << content_tag(:div, class: "alert alert--#{message}") do
          flash[message]
        end if flash[message].present?
        flash[message] = nil
      end
    end
  end

  def link_or_span_to(label, url)
    link_to_unless_current label, url do
      content_tag :span, label
    end
  end

  def simple_render(text)
    text.strip.gsub("\n", '<br>').html_safe
  end
end
