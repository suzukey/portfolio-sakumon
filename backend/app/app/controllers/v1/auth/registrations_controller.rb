module V1
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      private

      def sign_up_params
        params.permit(
          :email,
          :password,
          :name,
          :nickname,
          :introduction
        )
      end
    end
  end
end
