SimpleForm.setup do |config|
  config.button_class = 'mdl-button mdl-button--gray mdl-js-button mdl-js-ripple-effect'

  # Normal input textfields
  config.wrappers :mdl_field_floating,
      tag: 'div',
      class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label textfield__input--full',
      error_class: 'is-invalid' do |b|
    b.use :html5
    b.use :placeholder
    b.use :input, class: 'mdl-textfield__input'
    b.use :label, class: 'mdl-textfield__label'
    b.use :error, wrap_with: { tag: :span, class: 'mdl-textfield__error' }
  end

  config.default_wrapper = :mdl_field_floating
end
