require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir do menu' do
    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    expect(current_path).to eq suppliers_path
  end

  it 'com sucesso' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: '43447216000102', full_address: 'Avenida das Palmas, 100', city: 'Bauru',
                     state: 'SP', email: 'contato@acme.com', phone_number: '1140041040')
    Supplier.create!(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                     registration_number: '16074559000104', full_address: 'Torre da Indústria, 10', city: 'Teresina',
                     state: 'PI', email: 'vendas@spark.com', phone_number: '86940041016')

    visit root_path
    click_on 'Fornecedores'

    within 'h2' do
      expect(page).to have_content 'Fornecedores'
    end
    expect(page).not_to have_content 'Não existem fornecedores cadastrados'

    within 'table' do
      expect(page).to have_content 'ACME'
      expect(page).to have_content 'Bauru/SP'

      expect(page).to have_content 'Spark'
      expect(page).to have_content 'Teresina/PI'
    end
  end

  it 'e não existem fornecedores cadastrados' do
    visit root_path
    click_on 'Fornecedores'

    expect(page).to have_content 'Não existem fornecedores cadastrados'
  end


  it 'e volta pra tela inicial' do
    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    click_on 'Voltar'
  end
end
