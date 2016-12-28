module Formbuilder
class ResponseFieldPhoneNumber < ResponseField

    after_initialize -> {
      @serialized = true
      @sort_as_numeric = true
      @field_type = 'phone_number'
      @search_type = 'phone_number'
    }

    def render_input(value, opts = {})
      str = tag(
        :input,
        type: 'phone_number',
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
      value
    end

    def validate_response(value)
      unless (Float(value) rescue nil)
        "isn't a valid number."
      end
    end

  end
end