require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando Razão Social está vazio' do
        supplier = Supplier.new(corporate_name: '', brand_name: 'ACME', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Nome Fantasia está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: '', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando CNPJ está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Endereço está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                address: '', city: 'Bauru', state: 'SP',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Cidade está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: '', state: 'SP',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Estado está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: '',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Email está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP',
                                email: '', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Telefone está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP',
                                email: 'contato@acme.com', phone_number: '', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando CEP está vazio' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '')

        expect(supplier.valid?).to eq false
      end
    end

    context 'uniqueness' do
      it 'falso quando CNPJ já está em uso' do
        Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                         address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                         phone_number: '1140041040', postal_code: '16640-025')

        supplier = Supplier.new(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                                registration_number: '43447216000102', address: 'Torre da Indústria, 10',
                                city: 'Teresina', state: 'PI', email: 'vendas@spark.com', phone_number: '86940041016',
                                postal_code: '64000-020')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Email já está em uso' do
        Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                         address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                         phone_number: '1140041040', postal_code: '16640-025')

        supplier = Supplier.new(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                                registration_number: '16074559000104', address: 'Torre da Indústria, 10',
                                city: 'Teresina', state: 'PI', email: 'contato@acme.com', phone_number: '86940041016',
                                postal_code: '64000-020')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando Telefone já está em uso' do
        Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                         address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                         phone_number: '1140041040', postal_code: '16640-025')

        supplier = Supplier.new(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                                registration_number: '16074559000104', address: 'Torre da Indústria, 10',
                                city: 'Teresina', state: 'PI', email: 'vendas@spark.com', phone_number: '1140041040',
                                postal_code: '64000-020')

        expect(supplier.valid?).to eq false
      end
    end

    context 'format' do
      it 'falso quando o formato do CNPJ é inválido' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                                registration_number: '43.447.216/0001-02', address: 'Avenida das Palmas, 100',
                                city: 'Bauru', state: 'SP', email: 'contato@acme.com', phone_number: '1140041040',
                                postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando o formato do Estado é inválido' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43447216000102',
                                address: 'Avenida das Palmas, 100', city: 'Bauru', state: '11',
                                email: 'contato@acme.com', phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando o formato do CEP é inválido' do
        first_supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                                      registration_number: '43447216000102', address: 'Avenida das Palmas, 100',
                                      city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                                      phone_number: '1140041040', postal_code: '16f40-0b5')

        second_supplier = Supplier.new(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                                       registration_number: '16074559000104', address: 'Torre da Indústria, 10',
                                       city: 'Teresina', state: 'PI', email: 'vendas@spark.com',
                                       phone_number: '86940041016', postal_code: '64000020')

        expect(first_supplier.valid?).to eq false
        expect(second_supplier.valid?).to eq false
      end

      it 'falso quando o formato do Telefone é inválido' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                                registration_number: '43447216000102', address: 'Avenida das Palmas, 100',
                                city: 'Bauru', state: 'SP', email: 'contato@acme.com', phone_number: '(11) 4004-1040',
                                postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end
    end

    context 'length' do
      it 'falso quando o tamanho de CNPJ é inválido' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                                registration_number: '434472160000102', address: 'Avenida das Palmas, 100',
                                city: 'Bauru', state: 'SP', email: 'contato@acme.com', phone_number: '1140041040',
                                postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando o tamanho de Estado é inválido' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                                registration_number: '43447216000102', address: 'Avenida das Palmas, 100',
                                city: 'Bauru', state: 'São Paulo', email: 'contato@acme.com',
                                phone_number: '1140041040', postal_code: '16640-025')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando o tamanho de CEP é inválido' do
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                                registration_number: '43447216000102', address: 'Avenida das Palmas, 100',
                                city: 'Bauru', state: 'SP', email: 'contato@acme.com', phone_number: '1140041040',
                                postal_code: '16640-0251')

        expect(supplier.valid?).to eq false
      end

      it 'falso quando o tamanho de Telefone é inválido' do
        first_supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                                      registration_number: '43447216000102', address: 'Avenida das Palmas, 100',
                                      city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                                      phone_number: '011 40041040', postal_code: '16640-025')

        second_supplier = Supplier.new(corporate_name: 'Spark Industries Brasil LTDA', brand_name: 'Spark',
                                       registration_number: '16074559000104', address: 'Torre da Indústria, 10',
                                       city: 'Teresina', state: 'PI', email: 'vendas@spark.com',
                                       phone_number: '940041016', postal_code: '64000-020')

        expect(first_supplier.valid?).to eq false
        expect(second_supplier.valid?).to eq false
      end
    end
  end
end
