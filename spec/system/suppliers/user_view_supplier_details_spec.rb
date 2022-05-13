require 'rails_helper'

describe 'Usuário vê detalhes do fornecedor' do
  it 'a partir da tela inicial' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: '43447216000102', address: 'Avenida das Palmas, 100', city: 'Bauru',
                     state: 'SP', email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'

    expect(page).to have_content 'ACME LTDA'
    expect(page).to have_content 'CNPJ: 43447216000102'
    expect(page).to have_content 'Endereço: Avenida das Palmas, 100 - Bauru/SP'
    expect(page).to have_content 'Email: contato@acme.com'
    expect(page).to have_content 'Telefone: 1140041040'
  end

  it 'e volta pra tela de fornecedores' do
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                     registration_number: '16074559000104', address: 'Torre da Indústria, 10', city: 'Teresina',
                     state: 'PI', email: 'vendas@spark.com', phone_number: '86940041016', postal_code: '64000-020')

    visit root_path
    click_on 'Fornecedores'
    click_on 'Spark'
    click_on 'Voltar'

    expect(current_path).to eq suppliers_path
  end
end
