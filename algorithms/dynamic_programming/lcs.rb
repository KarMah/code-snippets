class LCS

  def initialize(str1, str2)
    @str1 = str1
    @str2 = str2
    @substrs = {}
    @lcs = Hash.new(Hash.new(''))
  end

  def find
    lcs(@str1.length, @str2.length)
  end

  def lcs_tabulation
    for l1 in (1..@str1.length) do
      for l2 in (1..@str2.length) do
        @lcs[l1][l2] = _lcs(l1,l2)
      end
    end
    @lcs[@str1.length][@str2.length]
  end
  private

  def lcs(l1, l2)
    return '' if l1 == 0 || l2 == 0
    if @str1[l1-1] == @str2[l2-1]
      return lcs(l1-1, l2-1) + @str1[l1-1]
    end

    lcs1, lcs2 = lcs(l1-1, l2), lcs(l1, l2-1)
    return (lcs1.length > lcs2.length) ? lcs1 : lcs2
  end

  def _lcs(l1,l2)
    return '' if l1 == 0 || l2 == 0
    return @lcs[l1-1][l2-1] + @str1[l1-1] if @str1[l1-1] == @str2[l2-1]

    lcs1, lcs2 = @lcs[l1-1][l2], @lcs[l1][l2-1]
    (lcs1.length > lcs2.length) ? lcs1 : lcs2
  end
end

lcs = LCS.new('ABCDGH', 'AEDFHR')
p lcs.find
p lcs.lcs_tabulation

lcs = LCS.new('AGGTAB', 'GXTXAYB')
p lcs.find
p lcs.lcs_tabulation
