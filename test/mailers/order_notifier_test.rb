require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.recived(orders(:bartek))
    assert_equal "Order Confirmation", mail.subject
    assert_equal ["mail@mail.com"], mail.to
    assert_equal ["super.ekstra.appka@tasiorsky.com"], mail.from
    assert_match /Programming Ruby/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:bartek))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["mail@mail.com"], mail.to
    assert_equal ["super.ekstra.appka@tasiorsky.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
