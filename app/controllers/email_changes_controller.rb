class EmailChangesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    new_email = params[:user][:email].to_s.strip

    if new_email.blank?
      flash.now[:alert] = "メールアドレスを入力してください"
      render :edit and return
    elsif !(new_email =~ URI::MailTo::EMAIL_REGEXP)
      flash.now[:alert] = "有効なメールアドレスを入力してください"
      render :edit and return
    end

    if new_email == current_user.email
      flash.now[:alert] = "現在のメールアドレスと同じです"
      render :edit and return
    end

    # 確認メール用のカラムを使わず直接更新
    if current_user.update(email: new_email)
      flash[:notice] = "メールアドレスを更新しました"
      redirect_to root_path
    else
      flash.now[:alert] = "保存に失敗しました。もう一度試してください。"
      render :edit
    end
  end
end
