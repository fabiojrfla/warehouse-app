require 'rails_helper'

describe 'Usuário edita um galpão' do
  it 'a partir da página de detalhes' do
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    expect(page).to have_content 'Editar Galpão'
    expect(page).to have_field 'Nome', with: 'Aeroporto SP'
    expect(page).to have_field 'Descrição', with: 'Galpão destinado para cargas internacionais'
    expect(page).to have_field 'Código', with: 'GRU'
    expect(page).to have_field 'Endereço', with: 'Avenida do Aeroporto, 1000'
    expect(page).to have_field 'Cidade', with: 'Guarulhos'
    expect(page).to have_field 'CEP', with: '15000-000'
    expect(page).to have_field 'Área', with: '100000'
  end
  it 'com sucesso' do
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome',	with: 'Centro SP'
    fill_in 'Descrição',	with: 'Galpão central da capital'
    fill_in 'Código',	with: 'CSP'
    fill_in 'Endereço',	with: 'Avenida Paulista, 1000'
    fill_in 'Cidade',	with: 'São Paulo'
    fill_in 'CEP',	with: '16000-000'
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Galpão atualizado com sucesso!'
    expect(page).to have_content 'Nome: Centro SP'
    expect(page).to have_content 'Galpão central da capital'
    expect(page).to have_content 'Galpão CSP'
    expect(page).to have_content 'Endereço: Avenida Paulista, 1000 CEP: 16000-000'
    expect(page).to have_content 'São Paulo'
    expect(page).to have_content 'Área: 100000m²'
  end

  it 'e precisa manter os campos obrigatórios' do
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Descrição',	with: ''
    fill_in 'Endereço',	with: ''
    fill_in 'CEP',	with: ''
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Não foi possível atualizar o galpão...'
    expect(page).to have_button 'Atualizar Galpão'
  end
end
