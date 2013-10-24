module Backbone
  class ViewGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def copy_view_file
      template 'view.js.coffee', "app/assets/javascript/views/#{file_name}_view.js.coffee"
    end

    def copy_template_file
      template 'template.jst.eco', "app/assets/javascript/templates/#{file_name}.jst.eco"
    end

    def copy_spec_file
      template 'view_spec.js.coffee', "spec/javascript/views/#{file_name}_view_spec.js.coffee"
    end
  end
end
