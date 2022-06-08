class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization

  # Pundit: white-list approach

  after_action :verify_authorized, except: %i[index profile show edit update new], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: %i[index profile], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username photo])
  end

  def user_download_url(s3_filename, download_filename=nil)
    s3_filename = s3_filename.to_s # converts pathnames to string
    download_filename ||= s3_filename.split('/').last
    url_options = {
      expires_in:                   60.minutes,
      response_content_disposition: "attachment; filename=\"#{download_filename}\""
    }
    object = bucket.object(s3_filename)
    object.exists? ? object.presigned_url(:get, url_options).to_s : nil
  end

  def bucket
    @bucket ||= Aws::S3::Resource.new(region: ENV['AWS_REGION']).bucket(ENV['AWS_BUCKET'])
  end


  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
