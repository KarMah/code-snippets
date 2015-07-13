class CommaDelimited < DataMapper::Base
  setup delimiter: ',', filename: :comma_delimited, 
        columns: { last_name: { type: :string }, first_name: { type: :string }, gender: { type: :string }, 
                   color: { type: :string }, dob: { type: :date, format: '%m/%d/%Y' } }
end
