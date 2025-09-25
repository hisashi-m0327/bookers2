class ApplicationController < ActionController::Base
  #ユーザー登録、ログイン認証などが使われる前に、下記configure_permitted_parameterメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource) #ログイン後の遷移先を決めるメソッド
    user_path(resource) #ログインしたユーザーの詳細ページ
  end

  protected


  #sign_upの際にnameのデータ操作を許可している
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
