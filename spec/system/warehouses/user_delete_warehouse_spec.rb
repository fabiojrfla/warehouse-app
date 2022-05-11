require 'rails_helper'

describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', postal_code: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Remover'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso!'
    expect(page).not_to have_content 'Aeroporto SP'
    expect(page).not_to have_content 'GRU'
  end

  it 'e não apaga outros galpões' do
    first_warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                        address: 'Avenida do Aeroporto, 1000', postal_code: '15000-000',
                                        description: 'Galpão destinado para cargas internacionais')

    second_warehouse = Warehouse.create!(name: 'Aeroporto RJ', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                         address: 'Avenida Atlantica, 50', postal_code: '20000-000',
                                         description: 'Galpão do Rio')

    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Remover'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso!'
    expect(page).not_to have_content 'Aeroporto SP'
    expect(page).not_to have_content 'GRU'
    expect(page).to have_content 'Aeroporto RJ'
    expect(page).to have_content 'SDU'
  end
end
