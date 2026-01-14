module FeatureSpecHelper
  def fill_in_form(prefix, params, scope: page)
    params.each do |attr, value|
      input = scope.find_all("##{prefix}_#{attr}")[0]
      next unless input
      case input.tag_name
      when 'input'
        input.fill_in(with: value)
      when 'select'
        input.find(:option, value).select_option
      end
    end
  end

  def select_multiple(selector, options)
    options.each { |option| page.find(selector).select(option) }
  end

  def resize_page(width, height: 1000)
    return unless page.driver.browser.try(:browser) == :chrome
    page.driver.browser.manage.window.resize_to(width, height)
  end

  def scroll_to(element)
    script = <<-JS
      arguments[0].scrollIntoView(true);
    JS

    Capybara.current_session.driver.browser.execute_script(script, element.native)
  end

  def trigger_help(topic)
    selector = "#help_popover_#{topic} [data-help-target='trigger']"
    find(selector).click
  end

  def fill_field(field, value)
    case field.tag_name
    when 'input'
      fill_in field[:id], with: value
    when 'select'
      select value, from: field[:id]
    else
      rails 'field type not recognized'
    end
  end

  def await_and_affirm_path(path)
    wait_until { page.current_path == path }
    page.current_path.should == path
  end

  def await_and_affirm_selector(selector)
    wait_until { page.has_css?(selector) }
    page.should have_css(selector)
  end

  def wait_until_page_change(&block)
    path = page.current_path
    block.call
    wait_until { page.current_path != path }
  end

  def script_click(selector)
    # This is necessary when icons are used, because with Capybara/Selenium, images
    # are not loaded, and therefore have zero size.
    page.execute_script("document.querySelector('#{selector}').click()")
  end
end
