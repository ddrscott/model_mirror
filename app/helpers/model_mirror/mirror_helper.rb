module ModelMirror
  module MirrorHelper
    def link_to_mirror(label, model)
      if Class === model
        link_to label, mirror_list_url(model_path: model.to_s.underscore)
      else
        link_to label, mirror_show_url(model_path: model.class.to_s.underscore, id: model.id)
      end
    end

    def link_to_mirror_belongs_to(label, id:, foreign_class:)
      link_to label, mirror_show_url(model_path: foreign_class.to_s.underscore, id: id)
    end

    def link_to_mirror_has_many(label, model:, has_many:)
      link_to label, mirror_has_many_url(model_path: model.class.to_s.underscore, id: model.id, has_many: has_many)
    end

    def link_to_mirror_relation(label, model:, relation:)
      link_to label, mirror_relation_url(model_path: model.class.to_s.underscore, id: model.id, relation: relation)
    end

    def th_attributes(attribs)
      attribs.map do |key, _value|
        content_tag(:th) do
          html_escape key.try!(:titleize)
        end
      end.join.html_safe
    end

    def td_model(row)
      row_class = row.class
      row.as_json.map do |key, value|
        content_tag(:td) do
          if model_class.primary_key == key
            link_to_mirror(value, row)
          elsif td_belongs_to?(row_class, key) and value
            relation = belongs_to_idx[[row_class, key]]
            link_to value, mirror_show_url(model_path: relation.klass.to_s.underscore, id: value)
          else
            html_escape value
          end
        end
      end.join.html_safe
    end

    def td_belongs_to?(model_class, key)
      @__td_belongs_to_idx ||= {}
      :nope != (@__td_belongs_to_idx[[model_class, key]] ||= (model_class.reflections.detect { |k,r| r.foreign_key == key }.try(:last) || :nope))
    end

    def belongs_to_idx
      @__td_belongs_to_idx ||= {}
    end

    def li_suffix(row, relation)
      child = row.send(relation.name)
      count = child.try(:count)
      count && " (#{count})"
    end
  end
end
