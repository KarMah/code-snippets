class PipeDelimited < DataMapper::Base
  setup delimiter: '|', filename: :pipe_delimited,
        columns: { last_name: { type: :string }, first_name: { type: :string }, col3: { type: :string },
                   gender: { type: :string }, color: { type: :string }, dob: { type: :date, format: '%m-%d-%Y' } }

end
