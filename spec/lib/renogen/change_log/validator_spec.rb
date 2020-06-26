require 'spec_helper'

describe Renogen::ChangeLog::Validator do
  let(:formatter) do
    double('Formatter', options: { 'validations' => validations} )
  end
  let(:change_log) { Renogen::ChangeLog::Model.new }
  let(:change_item) { Renogen::ChangeLog::Item.new('foo', 'bar') }
  let(:validations) do
    {
      'foo' => ['bar', 'baz']
    }
  end

  subject { described_class.new(formatter) }

  before do
    change_log.add_change(change_item)
  end

  describe '#validate!' do
    context 'when no validations are available' do
      let(:validations) { nil }

      it 'successfully passes the validation process' do
        expect { subject.validate!(changelog) }
          .to_not raise_error(Renogen::Exceptions::InvalidItemFound)
        subject.validate!(change_log)
      end
    end

    context 'when validation is successful' do
      it 'successfully passes the validation process' do
        expect { subject.validate!(changelog) }
          .to_not raise_error(Renogen::Exceptions::InvalidItemFound)
        subject.validate!(change_log)
      end
    end

    context 'when validation has failed' do
      let(:validations) do
        {
          'foo' => ['baz']
        }
      end

      it 'fails validation' do
        expect { subject.validate!(change_log) }
          .to raise_error(Renogen::Exceptions::InvalidItemFound)
      end
    end
  end
end
