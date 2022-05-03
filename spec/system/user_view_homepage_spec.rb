require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome do app' do
    visit('/')

    expect(page).to have_content('Galpões & Estoque')
  end

  it 'e vê os galpões cadastrados' do
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000)
    Warehouse.create(name: 'Mossoro', code: 'MVF', city: 'Mossoro', area: 50_000)

    visit('/')

    expect(page).not_to have_content('Não existem galpões cadastrados')

    expect(page).to have_content('Rio')
    expect(page).to have_content('Código: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000m²')

    expect(page).to have_content('Mossoro')
    expect(page).to have_content('Código: MVF')
    expect(page).to have_content('Cidade: Mossoro')
    expect(page).to have_content('50000m²')
  end

  it 'e não existem galpões cadastrados' do
    visit('/')

    expect(page).to have_content('Não existem galpões cadastrados')
  end
end
