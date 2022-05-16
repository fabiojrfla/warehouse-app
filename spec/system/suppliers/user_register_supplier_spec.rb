require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'com sucesso' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Razão Social',	with: 'ACME LTDA'
    fill_in 'Nome Fantasia',	with: 'ACME'
    fill_in 'CNPJ',	with: '43447216000102'
    fill_in 'Endereço',	with: 'Avenida das Palmas, 100'
    fill_in 'Cidade',	with: 'Bauru'
    fill_in 'Estado',	with: 'SP'
    fill_in 'CEP',	with: '16640-025'
    fill_in 'Email',	with: 'contato@acme.com'
    fill_in 'Telefone',	with: '1140041040'
    click_on 'Criar Fornecedor'

    expect(current_path).to eq supplier_path(Supplier.last[:id])
    expect(page).to have_content 'Fornecedor cadastrado com sucesso!'
    expect(page).to have_content 'ACME LTDA'
    expect(page).to have_content 'CNPJ: 43447216000102'
    expect(page).to have_content 'Endereço: Avenida das Palmas, 100 - Bauru/SP'
    expect(page).to have_content 'Email: contato@acme.com'
    expect(page).to have_content 'Telefone: 1140041040'
  end
end
