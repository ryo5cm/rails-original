class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  # deviseのstrong_parametersに新しく許可するパラメータを追加する必要がある
  # ここで、devise_parameter_sanitizerメソッドを直接before_actionに記述してはいけない。devise_parameter_sanitizerを呼び出すためのメソッドを作成してそのメソッドを呼び出すようにする。
  # devise_parameter_sanitizerメソッドはdeviseで追加されたメソッドなので、Deviseのコントローラ以外で呼び出すことができない。deviseコントローラーのアクションが動いた時のみ、configure_permitted_parametersを動かす処理を書く。
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインアップ時に、nicknmameとavatarというキーを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar, :gender)
  end
end
