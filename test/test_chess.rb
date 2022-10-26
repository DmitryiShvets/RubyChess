# frozen_string_literal: true

require "test_helper"

class TestChess < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Chess::VERSION
  end

  def test_To_Normal_Form
    assert toNormalForm('a1')=='a1'
    assert toNormalForm('E4')=='e4'
    assert toNormalForm('6d')=='d6'
    assert toNormalForm('1A')=='a1'
    assert_equal [-1,-1], toNormalForm('a10'),''
    assert_equal [-1,-1], toNormalForm('-2b'),''
    assert_equal [-1,-1], toNormalForm('q-2'),''
    #assert_equal [-1,-1], toNormalForm('z4'),''
    assert_equal 'j7', toNormalForm('7J'),''
    assert_equal 'c8', toNormalForm('8c'),''
    assert_equal 'a1', toNormalForm('0,0'),''
    assert_equal 'c1', toNormalForm('2,0'),''
  end

  def test_alphabet
    #assert_equal ['1','1'],alphabet(['a',1]),''
    #assert_equal ['1','1'],alphabet('a1'),''
    #assert_equal ['3','7'],alphabet(['c','7']),''
  end

  def test_alphabetOld
    #assert_equal ['a','1'],alphabetOld(['1','1']),''
    #assert_equal ['h','8'],alphabetOld(['8','8']),''
    #assert_equal ['g','6'],alphabetOld(['7','6  ']),''
  end
end
