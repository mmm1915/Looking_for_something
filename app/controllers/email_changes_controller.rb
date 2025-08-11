class EmailChangesController < ApplicationController
  before_action :authenticate_user!

  def edit
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

    current_user.unconfirmed_email = new_email
    current_user.confirmation_token = nil
    current_user.confirmation_sent_at = nil

    if current_user.save
      current_user.send_confirmation_instructions
      flash[:notice] = "確認メールを新しいメールアドレス宛に送信しました。メール内のリンクをクリックして変更を完了してください。"
      redirect_to root_path
    else
      flash.now[:alert] = "保存に失敗しました。もう一度試してください。"
      render :edit
    end
  end
end
