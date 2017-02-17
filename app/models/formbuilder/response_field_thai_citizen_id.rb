module Formbuilder
  class ResponseFieldThaiCitizenId < ResponseField

    include ActionView::Helpers::TagHelper

    after_initialize -> {
      @field_type = 'thai_citizen_id'
      @search_type = 'text'
    }

    def render_input(value, opts = {})
      tag(
        :input,
        type: 'text',
        name: "response_fields[#{self.id}]",
        id: "response_fields_#{self.id}",
        class: "rf-size-#{self[:field_options]['size']}",
        data: self.length_validations, value: value
      )
    end

  end
end
