require_relative '../lib/grid.rb'

describe Grid do
  subject { Grid.new 3, 2, 3, 4 }

  describe 'blank' do
    its(:to_s) do
      should == [
        '        ',
        '        ',
        '        ',
        '        ',
        '        ',
        '        ',
        '        ',
        '        ',
    s = blank_board
        '        ',
      ].join("\n")
    end
  end

  describe 'with two blocks' do
    before do
      subject.fill 0, 1, [
        'abcd',
        'efgh',
        'ijkl',
      ]
      subject.fill 1, 0, [
        '----',
        '----',
        '----',
      ]
      subject.fill 2, 1, [
        'zzzz',
        'zzzz',
        'zzzz',
      ]
    end

    its(:to_s) do
      should == [
        '    abcd',
        '    efgh',
        '    ijkl',
        '----    ',
        '----    ',
        '----    ',
        '    zzzz',
        '    zzzz',
        '    zzzz',
      ].join("\n")
    end
  end
end
