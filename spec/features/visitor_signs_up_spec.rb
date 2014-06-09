require 'oauth_helper'

feature 'Visitor should be able to signs up' do
  scenario 'with facebook' do
    visit(new_user_session_path)
    click_link('Sign in with Facebook')

    expect(page).to have_content('Autorizado com sucesso de uma conta do Facebook.')
  end

  scenario 'with twitter' do
    visit(new_user_session_path)
    click_link('Sign in with Twitter')

    expect(page).to have_content('Autorizado com sucesso de uma conta do Twitter.')
  end

  scenario 'with github' do
    visit(new_user_session_path)
    click_link('Sign in with Github')

    expect(page).to have_content('Autorizado com sucesso de uma conta do Github.')
  end

  scenario 'with linkedin' do
    visit(new_user_session_path)
    click_link('Sign in with Linkedin')

    expect(page).to have_content('Autorizado com sucesso de uma conta do Linkedin.')
  end
end

feature "Visitor shouldn't be able to sign up" do
  scenario 'without give permission' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit(new_user_session_path)
    click_link('Sign in with Facebook')

    current_path.should == new_user_session_path
    expect(page).to have_content('Não foi possível autorizar de uma conta do Facebook porque "Invalid credentials".')
  end
end