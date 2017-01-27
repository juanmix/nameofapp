# used to run any sort of code before the connection between a user and the server is established.
# This can be useful for authentication, for example. Here you can authenticate the users who are
# able to connect to the ActionCable server.

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # This line will identify each connection by the current_user who is connected to the app.
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def disconnect

    end

  # code that's very specific to Devise. method will return a user record if the user is logged in.
  # If the user isn't logged in, we are going to use Rails' default method to reject the connection attempt.
  # request.env['warden'] is an environment variable containing information about the current user. This is
  # where Devise stores its data about the current user. If a user isn't logged in, this variable will be
  # empty. reject_unauthorized_connection is a Rails method to stop connection attempts.
    protected

      def find_verified_user
        if verified_user = request.env['warden'].user
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end