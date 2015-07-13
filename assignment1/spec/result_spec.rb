require 'spec_helper'
require_relative '../lib/result'

describe Result do

  let!(:record) { double(:record, first_name: 'FName', last_name: 'LName', dob: Date.new(2015, 7, 6),
                         gender: 'Male', color: 'Red') }
  subject { Result.new(record) }
  let!(:record_instance) { subject.instance_variable_get(:@record) }


  describe '#initialize' do
    it 'should assign @record' do
      expect(subject.instance_variable_get(:@record)).to eq record
    end
  end

  describe '#name' do
    it "should return record's name" do
      expect(subject.name).to eq 'LName FName'
    end
  end

  describe '#to_s' do
    it 'should return result as a string' do
      expect(subject.to_s).to eq 'LName FName Male 7/6/2015 Red'
    end
  end

  describe '::all' do
    let!(:space_delimited) { double(:space_delimited, col1: 'S Column 1', col2: 'S Column 2') }
    let!(:pipe_delimited) { double(:pipe_delimited, col1: 'A Column 1', col2: 'A Column 2') }
    let!(:comma_delimited) { double(:comma_delimited, col1: 'C Column 1', col2: 'C Column 2') }

    let!(:result_space) { [Result.new(space_delimited)] }
    let!(:result_pipe) { [Result.new(pipe_delimited)] }
    let!(:result_comma) { [Result.new(comma_delimited)] }

    it 'should ' do
      allow(Result).to receive(:space_delimited_data).and_return(result_space)
      allow(Result).to receive(:pipe_delimited_data).and_return(result_pipe)
      allow(Result).to receive(:comma_delimited_data).and_return(result_comma)

      expect(Result.all).to match_array(result_space + result_pipe + result_comma)
    end
  end
end
