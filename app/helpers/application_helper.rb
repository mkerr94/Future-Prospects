module ApplicationHelper

    def bootstrap_class_for flash_type
      { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
    end

    def flash_messages(opts = {})
      flash.each do |msg_type, message|
        concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
                concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
                concat message
              end)
      end
      nil
    end

    def gravatar_for(college, options = { size: 80} )
      gravatar_id = Digest::MD5.hexdigest(college.email)
      gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{options[:size]}"
      image_tag(gravatar_url, alt: college.name, class:"img-circle")
    end

end
