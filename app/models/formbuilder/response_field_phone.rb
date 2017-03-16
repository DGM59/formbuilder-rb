module Formbuilder
  class ResponseFieldPhone < ResponseField

    after_initialize -> {
      @serialized = true
      @sort_as_numeric = true
      @field_type = 'phone'
      @search_type = 'phone'
    }

    def render_input(value, opts = {})
      str = tag(
        :input,
        type: 'phone',
        name: "response_fields[#{self.id}]",
        id: "response_fields_#{self.id}",
        class: "rf-size-#{self[:field_options]['size']}",
        value: value
      )

      if (units = self[:field_options]['units'].presence)
        str += "<span class='units'>#{units}</span>".html_safe
      end

      str
    end

    def render_entry(value, opts = {})
      value.delete(' ').gsub("-", "")
    end

    def validate_response(raw_value)
      value = raw_value.delete(' ').gsub("-", "")
      unless (Float(value) rescue nil)
        "isn't a valid number."
      end
    end

  end
end