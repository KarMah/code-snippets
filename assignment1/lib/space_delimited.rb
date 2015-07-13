class SpaceDelimited < DataMapper::Base
  setup delimiter: ' ', filename: :space_delimited,
        columns: { last_name: { type: :string }, first_name: { type: :string }, col3: { type: :string },
                   gender: { type: :string }, dob: { type: :date, format: '%m-%d-%Y' }, color: { type: :string }  }
end
