require 'rails_helper'

feature 'Visitor should be able to signs up' do
  scenario 'with email' do
    visit(new_user_registration_path)
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Senha', with: 'password'
      fill_in 'Confirmação de Senha', with: 'password'
      fill_in 'Nome', with: 'User'
      fill_in 'Sobrenome', with: 'Sobrenome'
    end
    click_button 'Inscrever-se'

    expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
    expect(page).to have_content('User Sobrenome')
  end
end

feature "Visitor shouldn't be able to sign up" do
  scenario 'with a email who already exists' do
    create(:user, email: 'user@example.com')

    visit(new_user_registration_path)
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Senha', with: 'password'
      fill_in 'Confirmação de Senha', with: 'password'
      fill_in 'Nome', with: 'User'
      fill_in 'Sobrenome', with: 'Sobrenome'
    end
    click_button 'Inscrever-se'

    expect(page).to have_content('já está em uso')
    expect(page).to have_selector("input[value='User']")
    expect(page).to have_selector("input[value='Sobrenome']")
  end

  scenario 'with a password too short' do

    visit(new_user_registration_path)
    within('#new_user') do
      fill_in 'Email', with: 'user2@example.com'
      fill_in 'Senha', with: 'pass'
      fill_in 'Confirmação de Senha', with: 'pass'
      fill_in 'Nome', with: 'User'
      fill_in 'Sobrenome', with: 'Sobrenome'
    end
    click_button 'Inscrever-se'

    expect(page).to have_content('é muito curto (mínimo: 8 caracteres)')
  end
end
