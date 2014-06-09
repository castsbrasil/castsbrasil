require 'oauth_helper'

feature 'Visitor should be able to signs up' do
  scenario 'with facebook' do
    visit(new_user_session_path)
    click_link('Entrar com Facebook')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Facebook.')
  end

  scenario 'with twitter' do
    visit(new_user_session_path)
    click_link('Entrar com Twitter')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Twitter.')
  end

  scenario 'with github' do
    visit(new_user_session_path)
    click_link('Entrar com Github')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Github.')
  end

  scenario 'with linkedin' do
    visit(new_user_session_path)
    click_link('Entrar com Linkedin')

    expect(page).to have_content('Autorizado com sucesso de uma conta de Linkedin.')
  end
end