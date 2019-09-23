module Fastlane
  module Helper
    class CodePushLoginHelper
      def self.log_in(access_key)
        Action.sh("npx code-push login --accessKey #{access_key}", print_command: false)
      rescue
        UI.user_error!("something went wrong during login with access key #{access_key}")
      end
      def self.log_out
        Action.sh("npx code-push logout")
      rescue
      end

      def self.is_logged_in
        value = true
        begin
          Action.sh("npx code-push whoami", false)
        rescue
          value = false
        end
        value
      end
    end
  end
end
