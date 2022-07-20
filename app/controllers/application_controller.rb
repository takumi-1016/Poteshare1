class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインに成功しました" 
        root_url  #　指定したいパスに変更
      else
        flash[:notice] = "新規登録完了しました。次にプロフィールを入力してください" 
        new_profile_path  #　指定したいパスに変更
      end
    end
  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation, :user_introduction, :user_image ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
