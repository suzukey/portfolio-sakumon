module V1
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      private

      def sign_up_params
        params.permit(
          :email,
          :password,
          :name,
          :nickname
        )
      end

      def account_update_params
        params.permit(
          :email,
          :name,
          :nickname,
          :profile
        )
      end
    end
  end
end
