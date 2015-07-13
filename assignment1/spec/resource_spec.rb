require 'spec_helper'
require_relative '../lib/data_mapper/resource'

module DataMapper
  describe Resource do

    let!(:columns) { { col1: { type: :string },
                       col2: { type: :date, format: '%m/%d/%Y' } } }
    subject { Resource.new( filename: :filename,
                            delimiter: '|',
                            columns: columns) }

    describe '#initialize' do
      it 'should assign name' do
        expect(subject.name).to eq :filename
      end

      it 'should assign columns' do
        expect(subject.columns).to eq columns
      end

      it 'should assign delimiter' do
        expect(subject.columns).to eq columns
      end
    end

    describe '#fullpath' do
      it 'should return the full path of the source file' do
        dir_path = 'path/to/directory'
        filename = 'path/to/directory/filename.txt'

        allow(subject).to receive(:path).and_return(dir_path)

        expect(subject.send(:fullpath)).to eq filename
      end
    end

    describe '#parse_line' do
      it 'should parse the line and return a hash map' do
        line = 'Column1 | 4/5/2015'
        col2 = Date.new(2015, 4, 5)
        expect(subject.send(:parse_line, line)).to eq({ col1: 'Column1', col2: col2})
      end
    end

    describe '#load_data' do
      let!(:file) { double(:file) }
      it 'should parse the line and return a hash map' do

        row1 = { col1: 'Column1', col2: Date.new(2015, 4, 5) }
        row2 = { col2: Date.new(2015, 10, 10), col1: 'Col1' }

        allow(File).to receive(:open).with(subject.send(:fullpath), 'r').and_return(file)
        allow(file).to receive(:eof?).and_return(false, false, true)
        allow(file).to receive(:readline).and_return('Column1 | 4/5/2015', 'Col1 | 10/10/2015')

        expect(subject.send(:load_data)).to match_array [row1, row2]
      end
    end
  end
end
