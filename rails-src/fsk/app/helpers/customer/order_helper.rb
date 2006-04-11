module Customer::OrderHelper
  def error_messages_for_line_items(options = {})
    options = options.symbolize_keys
    object = session[:line_errors]
    if object && !object.empty?
     content_tag("div",
       content_tag(
         options[:header_tag] || "h2",
         "#{pluralize(object.size, "error")} prohibited this order from being saved"
       ) +
       content_tag("p", "There were problems with the following fields:") +
       content_tag("ul", object.collect { |field,msg| content_tag("li", field+': '+msg) }),
       "id" => options[:id] || "errorExplanation", "class" => options[:class] || "errorExplanation"
     )
    else
     ""
    end
  end
end
