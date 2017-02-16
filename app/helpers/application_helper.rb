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
end
