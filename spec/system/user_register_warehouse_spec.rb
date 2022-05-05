require 'rails_helper'

describe 'Usuário cadastra um galpão' do
  it 'a partir da tela inicial' do
    visit root_path
    click_on 'Cadastrar Galpão'

    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Descrição'
    expect(page).to have_field 'Código'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'CEP'
    expect(page).to have_field 'Área'
  end

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
    click_on 'Enviar'

    expect(current_path).not_to eq new_warehouse_path
    expect(page).to have_content 'Galpão cadastrado com sucesso!'
    expect(page).to have_content 'Aeroporto SP'
    expect(page).to have_content 'Galpão destinado para cargas internacionais'
    expect(page).to have_content 'GRU'
    expect(page).to have_content 'Avenida do Aeroporto, 1000'
    expect(page).to have_content 'Guarulhos'
    expect(page).to have_content '15000-000'
    expect(page).to have_content '100000m²'
  end

  it 'e algo deu errado' do
    visit root_path
    click_on 'Cadastrar Galpão'
    click_on 'Enviar'

    expect(current_path).to eq warehouses_path
    expect(page).to have_content 'Algo deu errado...'
  end
end
