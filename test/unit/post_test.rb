require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    return unless Post.count == 0
    data = "aa"
    srand(0)
    (1..1000).each do 
      Post.create(name: data.next!, title: data.next!, content: data.next!, number: rand(1..10).to_i)
    end
  end
  def teardown
    Post.delete_all
  end
  test "there are 1k posts" do
    assert Post.count == 1000
    assert Post.all.length == 1000
  end
  test "we can count a subset of the posts" do
    query = Post.where(:number => [3, 7])
    count = query.count
    length = query.length
    assert count == length
  end
  test "we can sum a subset of the posts" do
    query = Post.where(:number => [2, 4, 6, 8])
    sum = query.sum(:number)
    reduce = query.reduce(0) { |s, p| s + p.number }
    assert sum == reduce
  end
  test "we can count distinct posts" do
    query = Post.select('DISTINCT ON(number) *')
    count = query.count
    length = query.length
    assert count == length
  end
  test "we can sum distinct posts" do
    query = Post.select('DISTINCT ON(number) *')
    sum = query.sum(:number)
    reduce = query.reduce(0) { |s, p| s + p.number }
    assert sum == reduce
  end
end
