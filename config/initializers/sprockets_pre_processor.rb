#Fix url problems on third party libraries

class SprocketsPreprocessor < Sprockets::Processor
  def evaluate(context, locals)
    processed_data = data
    if context.logical_path == 'bootstrap'
      processed_data = processed_data.gsub(/..\/fonts\//i, '')
      processed_data = processed_data.gsub(/\/\*\# sourceMappingURL=bootstrap.css.map \*\//i, '')
    end
    processed_data
  end
end

Rails.application.assets.register_preprocessor 'text/css', SprocketsPreprocessor