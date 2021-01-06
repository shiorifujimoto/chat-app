module SignInSupport
  def sign_in(user)# ログイン処理
    # サインインページへ移動する
    visit new_user_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    # ログインボタンをクリックする
    click_on ("Log in")
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end