require 'spec_helper'
require_relative '../lib/data_mapper/record'

module DataMapper
  describe Record do
    let!(:date) { Date.new(2015, 5, 5) }
    let!(:attributes) { { col1: 'column1', col2: 2, col3: date } }
    subject { Record.new( attributes) }

    describe '#initialize' do
      it 'should assign attributes to data' do
        expect(subject.send(:data)).to eq attributes
      end

      it 'should call build readers' do
        expect_any_instance_of(Record).to receive(:build_readers)
        Record.new(attributes)
      end
    end


    describe '#dynamic_methods' do
      it 'should respond to methods col1' do
        expect(subject.respond_to?(:col1)).to eq true
      end

      it 'should return column values' do
        expect(subject.col1).to eq 'column1'
      end
    end

    describe '#build_readers' do
      it 'should create singleton methods for attributes' do
        expect(subject).to receive(:define_singleton_method).with(:col1).once.and_return('column1')
        expect(subject).to receive(:define_singleton_method).with(:col2).once.and_return(1)
        expect(subject).to receive(:define_singleton_method).with(:col3).once.and_return(date)

        subject.send(:build_readers)
      end
    end
  end
end
