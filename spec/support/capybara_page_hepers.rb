module Capybara
  module PageHelpers

    def sign_in_user user
      sign_in_page = SignInPage.new
      sign_in_page.load

      sign_in_page.username.set user.username
      sign_in_page.password.set user.password || 'password'
      sign_in_page.button.click
    end

    def sign_out_user
      SignOutPage.new.load
      Capybara.reset_sessions!
    end



    def wait_until
      require "timeout"
      Timeout.timeout(Capybara.default_wait_time) do
        sleep(0.1) until value = yield
        value
      end
    end

    def wait_until_ajax_done
      wait_until { page.evaluate_script('$.active') == 0 }
    end

  end
end

