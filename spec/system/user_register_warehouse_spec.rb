require 'rails_helper'

describe 'Usuário cadastra um galpão' do
  it 'com sucesso' do
    visit root_path
    click_on 'Cadastrar Galpão'
    fill_in 'Nome',	with: 'Aeroporto SP'
    fill_in 'Descrição',	with: 'Galpão destinado para cargas internacionais'
    fill_in 'Código',	with: 'GRU'
    fill_in 'Endereço',	with: 'Avenida do Aeroporto, 1000'
    fill_in 'Cidade',	with: 'Guarulhos'
    fill_in 'CEP',	with: '15000-000'
    fill_in 'Área',	with: '100000'
    click_on 'Criar Galpão'

    expect(current_path).to eq warehouse_path(Warehouse.last[:id])
    expect(page).to have_content 'Galpão cadastrado com sucesso!'
    expect(page).to have_content 'Aeroporto SP'
    expect(page).to have_content 'Galpão destinado para cargas internacionais'
    expect(page).to have_content 'GRU'
    expect(page).to have_content 'Avenida do Aeroporto, 1000'
    expect(page).to have_content 'Guarulhos'
    expect(page).to have_content '15000-000'
    expect(page).to have_content '100000m²'
  end

  it 'com dados incompletos' do
    visit root_path
    click_on 'Cadastrar Galpão'
    fill_in 'Nome',	with: 'Aeroporto SP'
    fill_in 'Descrição',	with: ''
    fill_in 'Código',	with: 'GRU'
    fill_in 'Endereço',	with: ''
    fill_in 'Cidade',	with: 'Guarulhos'
    fill_in 'CEP',	with: ''
    fill_in 'Área',	with: '100000'
    click_on 'Criar Galpão'

    expect(current_path).to eq warehouses_path
    expect(page).to have_content 'Dados incompletos...'
    expect(page).to have_content 'Descrição não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'CEP não pode ficar em branco'
    expect(page).to have_content 'CEP não é válido'

    expect(page).not_to have_content 'Nome não pode ficar em branco'
    expect(page).not_to have_content 'Código não pode ficar em branco'
    expect(page).not_to have_content 'Cidade não pode ficar em branco'
    expect(page).not_to have_content 'Área não pode ficar em branco'

    expect(page).to have_field 'Nome', with: 'Aeroporto SP'
    expect(page).to have_field 'Descrição', with: ''
    expect(page).to have_field 'Código', with: 'GRU'
    expect(page).to have_field 'Endereço', with: ''
    expect(page).to have_field 'Cidade', with: 'Guarulhos'
    expect(page).to have_field 'CEP', with: ''
    expect(page).to have_field 'Área', with: '100000'
  end
end
