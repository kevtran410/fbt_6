module Admin::ToursHelper
  def btn_add_field name, f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for association, new_object, child_index: id do |builder|
      render association.to_s.singularize + "_field", f: builder
    end
    link_to name, "#", class: "btn-add-field",
      data: {id: id, fields: fields.gsub("\n", "")}
  end
end
