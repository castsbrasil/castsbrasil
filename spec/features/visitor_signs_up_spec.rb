require 'oauth_helper'

feature 'Visitor signs up' do
  scenario 'with facebook' do
    visit(new_user_session_path)
    click_link('Sign in with Facebook')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Facebook.')
  end
end