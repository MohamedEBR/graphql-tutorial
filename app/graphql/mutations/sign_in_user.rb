module Mutations
    class SignInUser < BaseMutation
      # ...code
  
      def resolve(email: nil)
        # ...code
  
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.encrypt_and_sign("user-id:#{ user.id }")
  
        context[:session][:token] = token
  
        # ...code
      end
    end
  end