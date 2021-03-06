module BrowserHelper
  extend self


  def switch_to_second_window browser
    raise "No. of windows should be two" if browser.window_handles.size != 2
    #Log.instance.debug "Number of window(s) open: #{browser.window_handles.size}"
    window_to_switch = browser.window_handles.find { |window| window != browser.window_handle }
    browser.switch_to.window window_to_switch
    return browser.current_url
    #Log.instance.debug "Switched to window " + browser.title
  end
=begin
  def self.close_popup browser
    if browser.window_handles.size > 1
      Log.instance.debug "Number of window(s) open: #{browser.window_handles.size}"
      parent_window = browser.window_handle
      windows_to_close = browser.window_handles.find_all { |window| window != browser.window_handle }
      windows_to_close.each do |window|
        browser.switch_to.window window
        Log.instance.debug "Closing window " + browser.title
        browser.close
      end
      browser.switch_to.window parent_window
    end
  end

  def switch_to_second_window browser
    raise "No. of windows should be two" if browser.window_handles.size != 2
    Log.instance.debug "Number of window(s) open: #{browser.window_handles.size}"
    window_to_switch = browser.window_handles.find { |window| window != browser.window_handle }
    browser.switch_to.window window_to_switch
    Log.instance.debug "Switched to window " + browser.title
  end

  def self.accept_alert browser
    if ExecutionEnvironment.browser_name == :safari
      file_location = File.expand_path File.dirname(__FILE__)
      cmd = "osascript #{file_location}/../../support/website/Safari_SendEnterKeyToAlert.scpt"
      system cmd
    else
      begin
        browser.switch_to.alert.accept
      rescue Selenium::WebDriver::Error::NoAlertPresentError
        Log.instance.debug "No alert message exists"
      end
    end
  end

  def open_new_tab(browser)
    body = browser.find_element(:tag_name => 'body')
    body.send_keys :control, 't'
    body
  end

  def switch_to_tab(browser, tab_number)
    raise "Tab number must be a number." unless tab_number.integer?
    browser.find_element(:tag_name => 'body').send_keys :control, tab_number
  end

  def close_current_tab(browser)
    browser.find_element(:tag_name => 'body').send_keys :control, 'w'
  end

  def alert_present?
    begin
      @browser.switch_to.alert
      return true
    rescue
      return false
    end
  end
=end
end