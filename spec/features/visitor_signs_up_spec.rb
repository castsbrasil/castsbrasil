require 'oauth_helper'

feature 'Visitor should be able to signs up' do
  scenario 'with facebook' do
    visit(new_user_session_path)
    click_link('Sign in with Facebook')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Facebook.')
  end

  scenario 'with twitter' do
    visit(new_user_session_path)
    click_link('Sign in with Twitter')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Twitter.')
  end

  scenario 'with github' do
    visit(new_user_session_path)
    click_link('Sign in with Github')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Github.')
  end

  scenario 'with linkedin' do
    visit(new_user_session_path)
    click_link('Sign in with Linkedin')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Linkedin.')
  end
end