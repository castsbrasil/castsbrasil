require 'oauth_helper'

feature 'Visitor should be able to signs up' do
  scenario 'with github' do
    visit(new_user_session_path)
    click_link('Entrar com Github')

    expect(page).to have_content('Autorizado com sucesso de uma conta do Github.')
  end
end

feature "Visitor shouldn't be able to sign up" do
  scenario 'without give permission' do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit(new_user_session_path)
    click_link('Entrar com Github')

    expect(current_path).to be == new_user_session_path
    expect(page).to have_content('Não foi possível autorizar de uma conta do GitHub porque "Invalid credentials".')
  end
end
